#include "libx11_ruby.h"
#include <X11/Xlib.h>

void
Init_libx11_constants(void)
{
  // reserved resource and constant definitions
  rb_define_const(rb_mLibX11, "NONE", LONG2NUM(None));
  rb_define_const(rb_mLibX11, "PARENT_RELATIVE", LONG2NUM(ParentRelative));
  rb_define_const(rb_mLibX11, "COPY_FROM_PARENT", LONG2NUM(CopyFromParent));
  rb_define_const(rb_mLibX11, "POINTER_WINDOW", LONG2NUM(PointerWindow));
  rb_define_const(rb_mLibX11, "INPUT_FOCUS", LONG2NUM(InputFocus));
  rb_define_const(rb_mLibX11, "POINTER_ROOT", LONG2NUM(PointerRoot));
  rb_define_const(rb_mLibX11, "ANY_PROPERTY_TYPE", LONG2NUM(AnyPropertyType));
  rb_define_const(rb_mLibX11, "ANY_KEY", LONG2NUM(AnyKey));
  rb_define_const(rb_mLibX11, "ANY_BUTTON", LONG2NUM(AnyButton));
  rb_define_const(rb_mLibX11, "ALL_TEMPORARY", LONG2NUM(AllTemporary));
  rb_define_const(rb_mLibX11, "CURRENT_TIME", LONG2NUM(CurrentTime));
  rb_define_const(rb_mLibX11, "NO_SYMBOL", LONG2NUM(NoSymbol));

  // input event masks
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

  // button masks
  rb_define_const(rb_mLibX11, "BUTTON1_MASK", LONG2NUM(Button1Mask));
  rb_define_const(rb_mLibX11, "BUTTON2_MASK", LONG2NUM(Button2Mask));
  rb_define_const(rb_mLibX11, "BUTTON3_MASK", LONG2NUM(Button3Mask));
  rb_define_const(rb_mLibX11, "BUTTON4_MASK", LONG2NUM(Button4Mask));
  rb_define_const(rb_mLibX11, "BUTTON5_MASK", LONG2NUM(Button5Mask));
  rb_define_const(rb_mLibX11, "ANY_MODIFIER", LONG2NUM(AnyModifier));
}
