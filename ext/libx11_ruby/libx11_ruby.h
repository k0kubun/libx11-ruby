#ifndef LIBX11_RUBY_H
#define LIBX11_RUBY_H 1

#include "ruby.h"
#include <X11/Xlib.h>

VALUE rb_mLibX11;

void Init_libx11_display(void);
void Init_libx11_window(void);

#endif /* LIBX11_RUBY_H */
