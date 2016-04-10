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
  int ret;
  Display *display;

  TypedData_Get_Struct(obj, Display, &display_type, display);
  ret = XCloseDisplay(display);
  return INT2FIX(ret);
}

/*
 * Xlib DefaultScreen
 */
static VALUE
rb_display_default_screen(VALUE self)
{
  Display *display;

  TypedData_Get_Struct(self, Display, &display_type, display);
  return INT2NUM(DefaultScreen(display));
}

/*
 * Xlib XDisplayString
 */
static VALUE
rb_display_xdisplay_string(VALUE self)
{
  Display *display;

  TypedData_Get_Struct(self, Display, &display_type, display);
  return rb_str_new_cstr(XDisplayString(display));
}

/*
 * Xlib DefaultRootWindow
 */
static VALUE
rb_display_default_root_window(VALUE self)
{
  Display *display;
  Window window;

  TypedData_Get_Struct(self, Display, &display_type, display);
  window = DefaultRootWindow(display);
  return ULONG2NUM(window);
}

/*
 * Xlib BlackPixel
 */
static VALUE
rb_display_black_pixel(VALUE self, VALUE screen_obj)
{
  Display *display;
  int screen = FIX2INT(screen_obj);

  TypedData_Get_Struct(self, Display, &display_type, display);
  return ULONG2NUM(BlackPixel(display, screen));
}

/*
 * Xlib WhitePixel
 */
static VALUE
rb_display_white_pixel(VALUE self, VALUE screen_obj)
{
  Display *display;
  int screen = FIX2INT(screen_obj);

  TypedData_Get_Struct(self, Display, &display_type, display);
  return ULONG2NUM(WhitePixel(display, screen));
}

/*
 * Xlib XSelectInput
 */
static VALUE
rb_display_xselect_input(VALUE self, VALUE window, VALUE event_mask)
{
  Display *display;
  int ret;

  TypedData_Get_Struct(self, Display, &display_type, display);
  ret = XSelectInput(display, NUM2ULONG(window), NUM2LONG(event_mask));
  return INT2NUM(ret);
}

/*
 * Xlib XMapWindow
 */
static VALUE
rb_display_xmap_window(VALUE self, VALUE window)
{
  Display *display;
  int ret;

  TypedData_Get_Struct(self, Display, &display_type, display);
  ret = XMapWindow(display, NUM2ULONG(window));
  return INT2NUM(ret);
}

/*
 * Xlib XSync
 */
static VALUE
rb_display_xsync(VALUE self, VALUE discard)
{
  Display *display;
  int ret;

  TypedData_Get_Struct(self, Display, &display_type, display);
  ret = XSync(display, RTEST(discard));
  return INT2NUM(ret);
}

/*
 * Xlib XGrabKey
 */
static VALUE
rb_display_xgrab_key(VALUE self, VALUE keycode, VALUE modifiers, VALUE grab_window,
    VALUE owner_events, VALUE pointer_mode, VALUE keyboard_mode)
{
  Display *display;
  int ret;

  TypedData_Get_Struct(self, Display, &display_type, display);
  ret = XGrabKey(display, NUM2INT(keycode), NUM2UINT(modifiers), NUM2ULONG(grab_window),
      RTEST(owner_events), NUM2INT(pointer_mode), NUM2INT(keyboard_mode));
  return INT2NUM(ret);
}

/*
 * Xlib XUngrabKey
 */
static VALUE
rb_display_xungrab_key(VALUE self, VALUE keycode, VALUE modifiers, VALUE grab_window)
{
  Display *display;
  int ret;

  TypedData_Get_Struct(self, Display, &display_type, display);
  ret = XUngrabKey(display, NUM2INT(keycode), NUM2UINT(modifiers), NUM2ULONG(grab_window));
  return INT2NUM(ret);
}

/*
 * Xlib XKeysymToKeycode
 */
static VALUE
rb_display_xkeysym_to_keycode(VALUE self, VALUE keysym)
{
  Display *display;
  unsigned char keycode;

  TypedData_Get_Struct(self, Display, &display_type, display);
  keycode = XKeysymToKeycode(display, NUM2ULONG(keysym));
  return INT2FIX((int)keycode);
}

/*
 * KeySym XKeycodeToKeysym(
 *   Display* display,
 *   KeyCode  keycode,
 *   int      index,
 * );
 */
static VALUE
rb_display_xkeycode_to_keysym(VALUE self, VALUE keycode, VALUE index)
{
  unsigned long keysym;
  Display *display;

  TypedData_Get_Struct(self, Display, &display_type, display);
  keysym = XKeycodeToKeysym(display, (unsigned char)NUM2INT(keycode), NUM2INT(index));
  return ULONG2NUM(keysym);
}

void
Init_libx11_display(void)
{
  rb_define_singleton_method(rb_mLibX11, "xopen_display", rb_libx11_xopen_display, -1);
  rb_define_singleton_method(rb_mLibX11, "xclose_display", rb_libx11_xclose_display, 1);

  rb_cDisplay = rb_define_class_under(rb_mLibX11, "Display", rb_cData);
  rb_define_method(rb_cDisplay, "default_root_window", rb_display_default_root_window, 0);
  rb_define_method(rb_cDisplay, "default_screen", rb_display_default_screen, 0);
  rb_define_method(rb_cDisplay, "xdisplay_string", rb_display_xdisplay_string, 0);
  rb_define_method(rb_cDisplay, "black_pixel", rb_display_black_pixel, 1);
  rb_define_method(rb_cDisplay, "white_pixel", rb_display_white_pixel, 1);
  rb_define_method(rb_cDisplay, "xmap_window", rb_display_xmap_window, 1);
  rb_define_method(rb_cDisplay, "xselect_input", rb_display_xselect_input, 2);
  rb_define_method(rb_cDisplay, "xsync", rb_display_xsync, 1);
  rb_define_method(rb_cDisplay, "xgrab_key", rb_display_xgrab_key, 6);
  rb_define_method(rb_cDisplay, "xungrab_key", rb_display_xungrab_key, 3);
  rb_define_method(rb_cDisplay, "xkeysym_to_keycode", rb_display_xkeysym_to_keycode, 1);
  rb_define_method(rb_cDisplay, "xkeycode_to_keysym", rb_display_xkeycode_to_keysym, 2);
}
