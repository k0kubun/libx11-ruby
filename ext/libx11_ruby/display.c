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
rb_libx11_xopen_display(VALUE self, VALUE display_name)
{
  Display *display;
  Check_Type(display_name, T_STRING);

  display = XOpenDisplay(RSTRING_PTR(display_name));
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

void
Init_libx11_display(void)
{
  rb_define_singleton_method(rb_mLibX11, "xopen_display", rb_libx11_xopen_display, 1);
  rb_define_singleton_method(rb_mLibX11, "xclose_display", rb_libx11_xclose_display, 1);

  rb_cDisplay = rb_define_class_under(rb_mLibX11, "Display", rb_cData);
}
