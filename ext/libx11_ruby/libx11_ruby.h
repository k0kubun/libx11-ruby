#ifndef LIBX11_RUBY_H
#define LIBX11_RUBY_H 1

#include "ruby.h"

VALUE rb_mLibX11;

void Init_libx11_constants(void);
void Init_libx11_display(void);
void Init_libx11_window(void);
void Init_libx11_xerror_event(void);
void Init_libx11_xevent(void);

#endif /* LIBX11_RUBY_H */
