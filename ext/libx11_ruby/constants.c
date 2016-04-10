#include "libx11_ruby.h"
#include <X11/Xlib.h>

void
Init_libx11_constants(void)
{
  // event masks
  rb_define_const(rb_mLibX11, "NO_EVENT_MASK", LONG2NUM(NoEventMask));
  rb_define_const(rb_mLibX11, "KEY_PRESS_MASK", LONG2NUM(KeyPressMask));
  rb_define_const(rb_mLibX11, "KEY_RELEASE_MASK", LONG2NUM(KeyReleaseMask));
  rb_define_const(rb_mLibX11, "BUTTON_PRESS_MASK", LONG2NUM(ButtonPressMask));
  rb_define_const(rb_mLibX11, "BUTTON_RELEASE_MASK", LONG2NUM(ButtonReleaseMask));
  rb_define_const(rb_mLibX11, "ENTER_WINDOW_MASK", LONG2NUM(EnterWindowMask));
  rb_define_const(rb_mLibX11, "LEAVE_WINDOW_MASK", LONG2NUM(LeaveWindowMask));
  rb_define_const(rb_mLibX11, "POINTER_MOTION_MASK", LONG2NUM(PointerMotionMask));
  rb_define_const(rb_mLibX11, "POINTER_MOTION_HINT_MASK", LONG2NUM(PointerMotionHintMask));
  rb_define_const(rb_mLibX11, "BUTTON1_MOTION_MASK", LONG2NUM(Button1MotionMask));
  rb_define_const(rb_mLibX11, "BUTTON2_MOTION_MASK", LONG2NUM(Button2MotionMask));
  rb_define_const(rb_mLibX11, "BUTTON3_MOTION_MASK", LONG2NUM(Button3MotionMask));
  rb_define_const(rb_mLibX11, "BUTTON4_MOTION_MASK", LONG2NUM(Button4MotionMask));
  rb_define_const(rb_mLibX11, "BUTTON5_MOTION_MASK", LONG2NUM(Button5MotionMask));
  rb_define_const(rb_mLibX11, "BUTTON_MOTION_MASK", LONG2NUM(ButtonMotionMask));
  rb_define_const(rb_mLibX11, "KEYMAP_STATE_MASK", LONG2NUM(KeymapStateMask));
  rb_define_const(rb_mLibX11, "EXPOSURE_MASK", LONG2NUM(ExposureMask));
  rb_define_const(rb_mLibX11, "VISIBILITY_CHANGE_MASK", LONG2NUM(VisibilityChangeMask));
  rb_define_const(rb_mLibX11, "STRUCTURE_NOTIFY_MASK", LONG2NUM(StructureNotifyMask));
  rb_define_const(rb_mLibX11, "RESIZE_REDIRECT_MASK", LONG2NUM(ResizeRedirectMask));
  rb_define_const(rb_mLibX11, "SUBSTRUCTURE_NOTIFY_MASK", LONG2NUM(SubstructureNotifyMask));
  rb_define_const(rb_mLibX11, "SUBSTRUCTURE_REDIRECT_MASK", LONG2NUM(SubstructureRedirectMask));
  rb_define_const(rb_mLibX11, "FOCUS_CHANGE_MASK", LONG2NUM(FocusChangeMask));
  rb_define_const(rb_mLibX11, "PROPERTY_CHANGE_MASK", LONG2NUM(PropertyChangeMask));
  rb_define_const(rb_mLibX11, "COLORMAP_CHANGE_MASK", LONG2NUM(ColormapChangeMask));
  rb_define_const(rb_mLibX11, "OWNER_GRAB_BUTTON_MASK", LONG2NUM(OwnerGrabButtonMask));
}