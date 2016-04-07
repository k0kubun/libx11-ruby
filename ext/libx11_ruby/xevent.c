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

static VALUE
rb_xevent_type(VALUE self)
{
  XEvent *event;

  TypedData_Get_Struct(self, XEvent, &xevent_type, event);
  return INT2NUM(event->type);
}

void
Init_libx11_xevent(void)
{
  rb_define_singleton_method(rb_mLibX11, "xnext_event", rb_libx11_xnext_event, 1);

  rb_cXEvent = rb_define_class_under(rb_mLibX11, "XEvent", rb_cData);
  rb_define_method(rb_cXEvent, "type", rb_xevent_type, 0);

  // event masks
  rb_define_const(rb_cXEvent, "NO_EVENT_MASK", LONG2NUM(NoEventMask));
  rb_define_const(rb_cXEvent, "KEY_PRESS_MASK", LONG2NUM(KeyPressMask));
  rb_define_const(rb_cXEvent, "KEY_RELEASE_MASK", LONG2NUM(KeyReleaseMask));
  rb_define_const(rb_cXEvent, "BUTTON_PRESS_MASK", LONG2NUM(ButtonPressMask));
  rb_define_const(rb_cXEvent, "BUTTON_RELEASE_MASK", LONG2NUM(ButtonReleaseMask));
  rb_define_const(rb_cXEvent, "ENTER_WINDOW_MASK", LONG2NUM(EnterWindowMask));
  rb_define_const(rb_cXEvent, "LEAVE_WINDOW_MASK", LONG2NUM(LeaveWindowMask));
  rb_define_const(rb_cXEvent, "POINTER_MOTION_MASK", LONG2NUM(PointerMotionMask));
  rb_define_const(rb_cXEvent, "POINTER_MOTION_HINT_MASK", LONG2NUM(PointerMotionHintMask));
  rb_define_const(rb_cXEvent, "BUTTON1_MOTION_MASK", LONG2NUM(Button1MotionMask));
  rb_define_const(rb_cXEvent, "BUTTON2_MOTION_MASK", LONG2NUM(Button2MotionMask));
  rb_define_const(rb_cXEvent, "BUTTON3_MOTION_MASK", LONG2NUM(Button3MotionMask));
  rb_define_const(rb_cXEvent, "BUTTON4_MOTION_MASK", LONG2NUM(Button4MotionMask));
  rb_define_const(rb_cXEvent, "BUTTON5_MOTION_MASK", LONG2NUM(Button5MotionMask));
  rb_define_const(rb_cXEvent, "BUTTON_MOTION_MASK", LONG2NUM(ButtonMotionMask));
  rb_define_const(rb_cXEvent, "KEYMAP_STATE_MASK", LONG2NUM(KeymapStateMask));
  rb_define_const(rb_cXEvent, "EXPOSURE_MASK", LONG2NUM(ExposureMask));
  rb_define_const(rb_cXEvent, "VISIBILITY_CHANGE_MASK", LONG2NUM(VisibilityChangeMask));
  rb_define_const(rb_cXEvent, "STRUCTURE_NOTIFY_MASK", LONG2NUM(StructureNotifyMask));
  rb_define_const(rb_cXEvent, "RESIZE_REDIRECT_MASK", LONG2NUM(ResizeRedirectMask));
  rb_define_const(rb_cXEvent, "SUBSTRUCTURE_NOTIFY_MASK", LONG2NUM(SubstructureNotifyMask));
  rb_define_const(rb_cXEvent, "SUBSTRUCTURE_REDIRECT_MASK", LONG2NUM(SubstructureRedirectMask));
  rb_define_const(rb_cXEvent, "FOCUS_CHANGE_MASK", LONG2NUM(FocusChangeMask));
  rb_define_const(rb_cXEvent, "PROPERTY_CHANGE_MASK", LONG2NUM(PropertyChangeMask));
  rb_define_const(rb_cXEvent, "COLORMAP_CHANGE_MASK", LONG2NUM(ColormapChangeMask));
  rb_define_const(rb_cXEvent, "OWNER_GRAB_BUTTON_MASK", LONG2NUM(OwnerGrabButtonMask));

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
