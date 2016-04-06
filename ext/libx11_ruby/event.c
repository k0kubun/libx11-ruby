#include "libx11_ruby.h"
#include <X11/Xlib.h>

VALUE rb_cXEvent;

extern rb_data_type_t display_type;

static void
xevent_dfree(void *arg)
{
  XEvent *event = arg;
  free(event);
}

static size_t
xevent_dsize(const void *arg)
{
  const XEvent *event = arg;
  return sizeof(event);
}

const rb_data_type_t xevent_type = {
  .wrap_struct_name = "libx11_xevent",
  .function = {
    .dmark = NULL,
    .dfree = xevent_dfree,
    .dsize = xevent_dsize,
    .reserved = { NULL, NULL },
  },
  .parent = NULL,
  .data = NULL,
  .flags = RUBY_TYPED_FREE_IMMEDIATELY,
};

/*
 * Xlib XNextEvent
 */
static VALUE
rb_libx11_xnext_event(VALUE self, VALUE obj)
{
  Display *display;
  XEvent *event;

  TypedData_Get_Struct(obj, Display, &display_type, display);

  event = (XEvent *)malloc(sizeof(XEvent));
  XNextEvent(display, event);
  return TypedData_Wrap_Struct(rb_cXEvent, &xevent_type, event);
}

void
Init_libx11_event(void)
{
  rb_define_singleton_method(rb_mLibX11, "xnext_event", rb_libx11_xnext_event, 1);

  rb_cXEvent = rb_define_class_under(rb_mLibX11, "XEvent", rb_cData);
  rb_define_const(rb_cXEvent, "KEY_PRESS_MASK", LONG2FIX(KeyPressMask));
}
