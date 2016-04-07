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
    rb_scan_args(1, argv, "10", &display_name);
    Check_Type(display_name, T_STRING);
    display = XOpenDisplay(RSTRING_PTR(display_name));
  }
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

void
Init_libx11_display(void)
{
  rb_define_singleton_method(rb_mLibX11, "xopen_display", rb_libx11_xopen_display, -1);
  rb_define_singleton_method(rb_mLibX11, "xclose_display", rb_libx11_xclose_display, 1);

  rb_cDisplay = rb_define_class_under(rb_mLibX11, "Display", rb_cData);
  rb_define_method(rb_cDisplay, "default_root_window", rb_display_default_root_window, 0);
  rb_define_method(rb_cDisplay, "default_screen", rb_display_default_screen, 0);
  rb_define_method(rb_cDisplay, "black_pixel", rb_display_black_pixel, 1);
  rb_define_method(rb_cDisplay, "white_pixel", rb_display_white_pixel, 1);
  rb_define_method(rb_cDisplay, "xmap_window", rb_display_xmap_window, 1);
  rb_define_method(rb_cDisplay, "xselect_input", rb_display_xselect_input, 2);
}
