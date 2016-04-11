#include "libx11_ruby.h"
#include <X11/Xlib.h>

VALUE rb_cDisplay;

static size_t
display_dsize(const void *arg)
{
  const Display *display = arg;
  return sizeof(display);
}

const rb_data_type_t display_type = {
  .wrap_struct_name = "libx11_display",
  .function = {
    .dmark = NULL,
    .dfree = NULL,
    .dsize = display_dsize,
    .reserved = { NULL, NULL },
  },
  .parent = NULL,
  .data = NULL,
  .flags = RUBY_TYPED_FREE_IMMEDIATELY,
};

Display*
get_display_struct(VALUE display_object)
{
  Display *display;
  TypedData_Get_Struct(display_object, Display, &display_type, display);
  return display;
}

/*
 * Xlib XOpenDisplay
 */
static VALUE
rb_libx11_xopen_display(int argc, VALUE *argv, RB_UNUSED_VAR(VALUE self))
{
  Display *display;

  if (argc == 0) {
    display = XOpenDisplay(NULL);
  } else {
    VALUE display_name;

    rb_check_arity(argc, 1, 1);
    rb_scan_args(argc, argv, "10", &display_name);
    Check_Type(display_name, T_STRING);
    display = XOpenDisplay(RSTRING_PTR(display_name));
  }
  if (display == NULL) return Qnil;
  return TypedData_Wrap_Struct(rb_cDisplay, &display_type, display);
}

/*
 * Xlib XCloseDisplay
 */
static VALUE
rb_libx11_xclose_display(VALUE self, VALUE obj)
{
  return INT2FIX(XCloseDisplay(get_display_struct(obj)));
}

/*
 * Xlib DefaultScreen
 */
static VALUE
rb_display_default_screen(VALUE self)
{
  return INT2NUM(DefaultScreen(get_display_struct(self)));
}

/*
 * #define ConnectionNumber(dpy) (((_XPrivDisplay)dpy)->fd)
 */
static VALUE
rb_display_connection_number(VALUE self)
{
  return INT2NUM(ConnectionNumber(get_display_struct(self)));
}

/*
 * Xlib XDisplayString
 */
static VALUE
rb_display_xdisplay_string(VALUE self)
{
  return rb_str_new_cstr(XDisplayString(get_display_struct(self)));
}

/*
 * Xlib DefaultRootWindow
 */
static VALUE
rb_display_default_root_window(VALUE self)
{
  return ULONG2NUM(DefaultRootWindow(get_display_struct(self)));
}

/*
 * Xlib BlackPixel
 */
static VALUE
rb_display_black_pixel(VALUE self, VALUE screen_obj)
{
  return ULONG2NUM(BlackPixel(get_display_struct(self), FIX2INT(screen_obj)));
}

/*
 * Xlib WhitePixel
 */
static VALUE
rb_display_white_pixel(VALUE self, VALUE screen_obj)
{
  return ULONG2NUM(WhitePixel(get_display_struct(self), FIX2INT(screen_obj)));
}

/*
 * Xlib XSelectInput
 */
static VALUE
rb_display_xselect_input(VALUE self, VALUE window, VALUE event_mask)
{
  return INT2NUM(XSelectInput(get_display_struct(self), NUM2ULONG(window), NUM2LONG(event_mask)));
}

/*
 * Xlib XMapWindow
 */
static VALUE
rb_display_xmap_window(VALUE self, VALUE window)
{
  return INT2NUM(XMapWindow(get_display_struct(self), NUM2ULONG(window)));
}

/*
 * Xlib XSync
 */
static VALUE
rb_display_xsync(VALUE self, VALUE discard)
{
  return INT2NUM(XSync(get_display_struct(self), RTEST(discard)));
}

/*
 * Xlib XGrabKey
 */
static VALUE
rb_display_xgrab_key(VALUE self, VALUE keycode, VALUE modifiers, VALUE grab_window,
    VALUE owner_events, VALUE pointer_mode, VALUE keyboard_mode)
{
  int ret = XGrabKey(get_display_struct(self), NUM2INT(keycode), NUM2UINT(modifiers), NUM2ULONG(grab_window),
      RTEST(owner_events), NUM2INT(pointer_mode), NUM2INT(keyboard_mode));
  return INT2NUM(ret);
}

/*
 * Xlib XUngrabKey
 */
static VALUE
rb_display_xungrab_key(VALUE self, VALUE keycode, VALUE modifiers, VALUE grab_window)
{
  int ret = XUngrabKey(get_display_struct(self), NUM2INT(keycode), NUM2UINT(modifiers), NUM2ULONG(grab_window));
  return INT2NUM(ret);
}

/*
 * Xlib XKeysymToKeycode
 */
static VALUE
rb_display_xkeysym_to_keycode(VALUE self, VALUE keysym)
{
  unsigned char keycode = XKeysymToKeycode(get_display_struct(self), NUM2ULONG(keysym));
  return INT2FIX((int)keycode);
}

void
Init_libx11_display(void)
{
  rb_define_singleton_method(rb_mLibX11, "xopen_display", rb_libx11_xopen_display, -1);
  rb_define_singleton_method(rb_mLibX11, "xclose_display", rb_libx11_xclose_display, 1);

  rb_cDisplay = rb_define_class_under(rb_mLibX11, "Display", rb_cData);
  rb_define_method(rb_cDisplay, "default_root_window", rb_display_default_root_window, 0);
  rb_define_method(rb_cDisplay, "default_screen", rb_display_default_screen, 0);
  rb_define_method(rb_cDisplay, "connection_number", rb_display_connection_number, 0);
  rb_define_method(rb_cDisplay, "xdisplay_string", rb_display_xdisplay_string, 0);
  rb_define_method(rb_cDisplay, "black_pixel", rb_display_black_pixel, 1);
  rb_define_method(rb_cDisplay, "white_pixel", rb_display_white_pixel, 1);
  rb_define_method(rb_cDisplay, "xmap_window", rb_display_xmap_window, 1);
  rb_define_method(rb_cDisplay, "xselect_input", rb_display_xselect_input, 2);
  rb_define_method(rb_cDisplay, "xsync", rb_display_xsync, 1);
  rb_define_method(rb_cDisplay, "xgrab_key", rb_display_xgrab_key, 6);
  rb_define_method(rb_cDisplay, "xungrab_key", rb_display_xungrab_key, 3);
  rb_define_method(rb_cDisplay, "xkeysym_to_keycode", rb_display_xkeysym_to_keycode, 1);
}
