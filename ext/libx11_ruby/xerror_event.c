#include "libx11_ruby.h"
#include <X11/Xlib.h>

extern VALUE rb_cDisplay;
VALUE rb_cXErrorEvent;

extern rb_data_type_t display_type;

static size_t
xerror_event_dsize(const void *arg)
{
  const XErrorEvent *event = arg;
  return sizeof(event);
}

const rb_data_type_t xerror_event_type = {
  .wrap_struct_name = "libx11_xerror_event",
  .function = {
    .dmark = NULL,
    .dfree = NULL,
    .dsize = xerror_event_dsize,
    .reserved = { NULL, NULL },
  },
  .parent = NULL,
  .data = NULL,
  .flags = RUBY_TYPED_FREE_IMMEDIATELY,
};

static VALUE error_handler_proc = Qnil;

static int
error_handler_func(Display *display, XErrorEvent *event)
{
  if (NIL_P(error_handler_proc)) {
    return 1;
  } else {
    VALUE args = rb_ary_new();
    rb_ary_push(args, TypedData_Wrap_Struct(rb_cDisplay, &display_type, display));
    rb_ary_push(args, TypedData_Wrap_Struct(rb_cXErrorEvent, &xerror_event_type, event));
    rb_proc_call(error_handler_proc, args);
    return 0;
  }
}

/*
 * Xlib XSetErrorHandler
 */
static VALUE
rb_libx11_xset_error_handler(int argc, VALUE *argv, VALUE self)
{
  rb_check_arity(argc, 0, 0);
  rb_scan_args(argc, argv, "00&", &error_handler_proc);

  XSetErrorHandler(error_handler_func);
  return Qnil;
}

static VALUE
rb_xerror_event_type(VALUE self)
{
  XErrorEvent *event;
  TypedData_Get_Struct(self, XErrorEvent, &xerror_event_type, event);
  return INT2FIX(event->type);
}

void
Init_libx11_xerror_event(void)
{
  rb_define_singleton_method(rb_mLibX11, "xset_error_handler", rb_libx11_xset_error_handler, -1);

  rb_cXErrorEvent = rb_define_class_under(rb_mLibX11, "XErrorEvent", rb_cData);
  rb_define_method(rb_cXErrorEvent, "type", rb_xerror_event_type, 0);
}
