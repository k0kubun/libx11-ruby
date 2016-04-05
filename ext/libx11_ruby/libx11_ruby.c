#include "libx11_ruby.h"

VALUE rb_mLibX11;

void
Init_libx11_ruby(void)
{
  rb_mLibX11 = rb_define_module("LibX11");
}
