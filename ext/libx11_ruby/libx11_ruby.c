#include "libx11_ruby.h"

void
Init_libx11_ruby(void)
{
  rb_mLibX11 = rb_define_module("LibX11");

  Init_libx11_display();
  Init_libx11_event();
  Init_libx11_window();
}
