#include "libx11_ruby.h"
#include <X11/Xlib.h>

extern Display* get_display_struct(VALUE);

/*
 * Xlib XCreateSimpleWindow
 */
static VALUE
rb_libx11_xcreate_simple_window(VALUE self, VALUE display_obj, VALUE parent_window, VALUE x, VALUE y,
    VALUE width, VALUE height, VALUE border_width, VALUE border_color, VALUE background_color)
{
  Window ret = XCreateSimpleWindow(get_display_struct(display_obj), NUM2ULONG(parent_window), NUM2INT(x), NUM2INT(y),
      NUM2UINT(width), NUM2UINT(height), FIX2UINT(border_width), NUM2ULONG(border_color), NUM2ULONG(background_color));
  return ULONG2NUM(ret);
}

/*
 * Xlib XDestroyWindow
 */
static VALUE
rb_libx11_xdestroy_window(VALUE self, VALUE display_obj, VALUE window)
{
  int ret = XDestroyWindow(get_display_struct(display_obj), NUM2ULONG(window));
  return INT2NUM(ret);
}

void
Init_libx11_window(void)
{
  rb_define_singleton_method(rb_mLibX11, "xcreate_simple_window", rb_libx11_xcreate_simple_window, 9);
  rb_define_singleton_method(rb_mLibX11, "xdestroy_window", rb_libx11_xdestroy_window, 2);
}
