#include "libx11_ruby.h"
#include <X11/Xlib.h>

extern rb_data_type_t display_type;

/*
 * Xlib DefaultRootWindow
 */
static VALUE
rb_libx11_default_root_window(VALUE self, VALUE obj)
{
  Display *display;
  Window window;

  TypedData_Get_Struct(obj, Display, &display_type, display);
  window = DefaultRootWindow(display);
  return ULONG2NUM(window);
}

void
Init_libx11_window(void)
{
  rb_define_singleton_method(rb_mLibX11, "default_root_window", rb_libx11_default_root_window, 1);
}
