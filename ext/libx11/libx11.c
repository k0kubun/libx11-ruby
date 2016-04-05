#include "libx11.h"

VALUE rb_mLibx11;

void
Init_libx11(void)
{
  rb_mLibx11 = rb_define_module("Libx11");
}
