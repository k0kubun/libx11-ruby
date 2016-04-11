#include "libx11_ruby.h"
#include <X11/Xlib.h>

VALUE rb_cXEvent;

extern Display* get_display_struct(VALUE);

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
  XEvent *event = (XEvent *)malloc(sizeof(XEvent));
  XNextEvent(get_display_struct(obj), event);
  return TypedData_Wrap_Struct(rb_cXEvent, &xevent_type, event);
}

static VALUE
rb_xevent_type(VALUE self)
{
  XEvent *event;

  TypedData_Get_Struct(self, XEvent, &xevent_type, event);
  return INT2NUM(event->type);
}

/*
 * KeySym XLookupKeysym(
 *   XKeyEvent* key_event,
 *   int        index
 * );
 */
static VALUE
rb_libx11_xlookup_keysym(VALUE self, VALUE event_obj, VALUE index)
{
  XEvent *event;
  unsigned long keysym;

  TypedData_Get_Struct(event_obj, XEvent, &xevent_type, event);
  keysym = XLookupKeysym(&event->xkey, NUM2INT(index));
  return ULONG2NUM(keysym);
}

void
Init_libx11_xevent(void)
{
  rb_define_singleton_method(rb_mLibX11, "xnext_event", rb_libx11_xnext_event, 1);
  rb_define_singleton_method(rb_mLibX11, "xlookup_keysym", rb_libx11_xlookup_keysym, 2);

  rb_cXEvent = rb_define_class_under(rb_mLibX11, "XEvent", rb_cData);
  rb_define_method(rb_cXEvent, "type", rb_xevent_type, 0);

  // event
  rb_define_const(rb_cXEvent, "KEY_PRESS", INT2FIX(KeyPress));
  rb_define_const(rb_cXEvent, "KEY_RELEASE", INT2FIX(KeyRelease));
  rb_define_const(rb_cXEvent, "BUTTON_PRESS", INT2FIX(ButtonPress));
  rb_define_const(rb_cXEvent, "BUTTON_RELEASE", INT2FIX(ButtonRelease));
  rb_define_const(rb_cXEvent, "MOTION_NOTIFY", INT2FIX(MotionNotify));
  rb_define_const(rb_cXEvent, "ENTER_NOTIFY", INT2FIX(EnterNotify));
  rb_define_const(rb_cXEvent, "LEAVE_NOTIFY", INT2FIX(LeaveNotify));
  rb_define_const(rb_cXEvent, "FOCUS_IN", INT2FIX(FocusIn));
  rb_define_const(rb_cXEvent, "FOCUS_OUT", INT2FIX(FocusOut));
  rb_define_const(rb_cXEvent, "KEYMAP_NOTIFY", INT2FIX(KeymapNotify));
  rb_define_const(rb_cXEvent, "EXPOSE", INT2FIX(Expose));
  rb_define_const(rb_cXEvent, "GRAPHICS_EXPOSE", INT2FIX(GraphicsExpose));
  rb_define_const(rb_cXEvent, "NO_EXPOSE", INT2FIX(NoExpose));
  rb_define_const(rb_cXEvent, "VISIBILITY_NOTIFY", INT2FIX(VisibilityNotify));
  rb_define_const(rb_cXEvent, "CREATE_NOTIFY", INT2FIX(CreateNotify));
  rb_define_const(rb_cXEvent, "DESTROY_NOTIFY", INT2FIX(DestroyNotify));
  rb_define_const(rb_cXEvent, "UNMAP_NOTIFY", INT2FIX(UnmapNotify));
  rb_define_const(rb_cXEvent, "MAP_NOTIFY", INT2FIX(MapNotify));
  rb_define_const(rb_cXEvent, "MAP_REQUEST", INT2FIX(MapRequest));
  rb_define_const(rb_cXEvent, "REPARENT_NOTIFY", INT2FIX(ReparentNotify));
  rb_define_const(rb_cXEvent, "CONFIGURE_NOTIFY", INT2FIX(ConfigureNotify));
  rb_define_const(rb_cXEvent, "CONFIGURE_REQUEST", INT2FIX(ConfigureRequest));
  rb_define_const(rb_cXEvent, "GRAVITY_NOTIFY", INT2FIX(GravityNotify));
  rb_define_const(rb_cXEvent, "RESIZE_REQUEST", INT2FIX(ResizeRequest));
  rb_define_const(rb_cXEvent, "CIRCULATE_NOTIFY", INT2FIX(CirculateNotify));
  rb_define_const(rb_cXEvent, "CIRCULATE_REQUEST", INT2FIX(CirculateRequest));
  rb_define_const(rb_cXEvent, "PROPERTY_NOTIFY", INT2FIX(PropertyNotify));
  rb_define_const(rb_cXEvent, "SELECTION_CLEAR", INT2FIX(SelectionClear));
  rb_define_const(rb_cXEvent, "SELECTION_REQUEST", INT2FIX(SelectionRequest));
  rb_define_const(rb_cXEvent, "SELKECTION_NOTIFY", INT2FIX(SelectionNotify));
  rb_define_const(rb_cXEvent, "COLORMAP_NOTIFY", INT2FIX(ColormapNotify));
  rb_define_const(rb_cXEvent, "CLIENT_MESSAGE", INT2FIX(ClientMessage));
  rb_define_const(rb_cXEvent, "MAPPING_NOTIFY", INT2FIX(MappingNotify));
  rb_define_const(rb_cXEvent, "GENERIC_EVENT", INT2FIX(GenericEvent));
  rb_define_const(rb_cXEvent, "LAST_EVENT", INT2FIX(LASTEvent));
}
