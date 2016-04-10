#include "libx11_ruby.h"
#include <X11/keysym.h>
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

  // tty functions keys
  rb_define_const(rb_mLibX11, "XK_BackSpace", LONG2NUM(XK_BackSpace));
  rb_define_const(rb_mLibX11, "XK_Tab", LONG2NUM(XK_Tab));
  rb_define_const(rb_mLibX11, "XK_Linefeed", LONG2NUM(XK_Linefeed));
  rb_define_const(rb_mLibX11, "XK_Clear", LONG2NUM(XK_Clear));
  rb_define_const(rb_mLibX11, "XK_Return", LONG2NUM(XK_Return));
  rb_define_const(rb_mLibX11, "XK_Pause", LONG2NUM(XK_Pause));
  rb_define_const(rb_mLibX11, "XK_Scroll_Lock", LONG2NUM(XK_Scroll_Lock));
  rb_define_const(rb_mLibX11, "XK_Sys_Req", LONG2NUM(XK_Sys_Req));
  rb_define_const(rb_mLibX11, "XK_Escape", LONG2NUM(XK_Escape));
  rb_define_const(rb_mLibX11, "XK_Delete", LONG2NUM(XK_Delete));

  // latin 1
  rb_define_const(rb_mLibX11, "XK_space", LONG2NUM(XK_space));
  rb_define_const(rb_mLibX11, "XK_exclam", LONG2NUM(XK_exclam));
  rb_define_const(rb_mLibX11, "XK_quotedbl", LONG2NUM(XK_quotedbl));
  rb_define_const(rb_mLibX11, "XK_numbersign", LONG2NUM(XK_numbersign));
  rb_define_const(rb_mLibX11, "XK_dollar", LONG2NUM(XK_dollar));
  rb_define_const(rb_mLibX11, "XK_percent", LONG2NUM(XK_percent));
  rb_define_const(rb_mLibX11, "XK_ampersand", LONG2NUM(XK_ampersand));
  rb_define_const(rb_mLibX11, "XK_apostrophe", LONG2NUM(XK_apostrophe));
  rb_define_const(rb_mLibX11, "XK_quoteright", LONG2NUM(XK_quoteright));
  rb_define_const(rb_mLibX11, "XK_parenleft", LONG2NUM(XK_parenleft));
  rb_define_const(rb_mLibX11, "XK_parenright", LONG2NUM(XK_parenright));
  rb_define_const(rb_mLibX11, "XK_asterisk", LONG2NUM(XK_asterisk));
  rb_define_const(rb_mLibX11, "XK_plus", LONG2NUM(XK_plus));
  rb_define_const(rb_mLibX11, "XK_comma", LONG2NUM(XK_comma));
  rb_define_const(rb_mLibX11, "XK_minus", LONG2NUM(XK_minus));
  rb_define_const(rb_mLibX11, "XK_period", LONG2NUM(XK_period));
  rb_define_const(rb_mLibX11, "XK_slash", LONG2NUM(XK_slash));
  rb_define_const(rb_mLibX11, "XK_0", LONG2NUM(XK_0));
  rb_define_const(rb_mLibX11, "XK_1", LONG2NUM(XK_1));
  rb_define_const(rb_mLibX11, "XK_2", LONG2NUM(XK_2));
  rb_define_const(rb_mLibX11, "XK_3", LONG2NUM(XK_3));
  rb_define_const(rb_mLibX11, "XK_4", LONG2NUM(XK_4));
  rb_define_const(rb_mLibX11, "XK_5", LONG2NUM(XK_5));
  rb_define_const(rb_mLibX11, "XK_6", LONG2NUM(XK_6));
  rb_define_const(rb_mLibX11, "XK_7", LONG2NUM(XK_7));
  rb_define_const(rb_mLibX11, "XK_8", LONG2NUM(XK_8));
  rb_define_const(rb_mLibX11, "XK_9", LONG2NUM(XK_9));
  rb_define_const(rb_mLibX11, "XK_colon", LONG2NUM(XK_colon));
  rb_define_const(rb_mLibX11, "XK_semicolon", LONG2NUM(XK_semicolon));
  rb_define_const(rb_mLibX11, "XK_less", LONG2NUM(XK_less));
  rb_define_const(rb_mLibX11, "XK_equal", LONG2NUM(XK_equal));
  rb_define_const(rb_mLibX11, "XK_greater", LONG2NUM(XK_greater));
  rb_define_const(rb_mLibX11, "XK_question", LONG2NUM(XK_question));
  rb_define_const(rb_mLibX11, "XK_at", LONG2NUM(XK_at));
  rb_define_const(rb_mLibX11, "XK_A", LONG2NUM(XK_A));
  rb_define_const(rb_mLibX11, "XK_B", LONG2NUM(XK_B));
  rb_define_const(rb_mLibX11, "XK_C", LONG2NUM(XK_C));
  rb_define_const(rb_mLibX11, "XK_D", LONG2NUM(XK_D));
  rb_define_const(rb_mLibX11, "XK_E", LONG2NUM(XK_E));
  rb_define_const(rb_mLibX11, "XK_F", LONG2NUM(XK_F));
  rb_define_const(rb_mLibX11, "XK_G", LONG2NUM(XK_G));
  rb_define_const(rb_mLibX11, "XK_H", LONG2NUM(XK_H));
  rb_define_const(rb_mLibX11, "XK_I", LONG2NUM(XK_I));
  rb_define_const(rb_mLibX11, "XK_J", LONG2NUM(XK_J));
  rb_define_const(rb_mLibX11, "XK_K", LONG2NUM(XK_K));
  rb_define_const(rb_mLibX11, "XK_L", LONG2NUM(XK_L));
  rb_define_const(rb_mLibX11, "XK_M", LONG2NUM(XK_M));
  rb_define_const(rb_mLibX11, "XK_N", LONG2NUM(XK_N));
  rb_define_const(rb_mLibX11, "XK_O", LONG2NUM(XK_O));
  rb_define_const(rb_mLibX11, "XK_P", LONG2NUM(XK_P));
  rb_define_const(rb_mLibX11, "XK_Q", LONG2NUM(XK_Q));
  rb_define_const(rb_mLibX11, "XK_R", LONG2NUM(XK_R));
  rb_define_const(rb_mLibX11, "XK_S", LONG2NUM(XK_S));
  rb_define_const(rb_mLibX11, "XK_T", LONG2NUM(XK_T));
  rb_define_const(rb_mLibX11, "XK_U", LONG2NUM(XK_U));
  rb_define_const(rb_mLibX11, "XK_V", LONG2NUM(XK_V));
  rb_define_const(rb_mLibX11, "XK_W", LONG2NUM(XK_W));
  rb_define_const(rb_mLibX11, "XK_X", LONG2NUM(XK_X));
  rb_define_const(rb_mLibX11, "XK_Y", LONG2NUM(XK_Y));
  rb_define_const(rb_mLibX11, "XK_Z", LONG2NUM(XK_Z));
  rb_define_const(rb_mLibX11, "XK_bracketleft", LONG2NUM(XK_bracketleft));
  rb_define_const(rb_mLibX11, "XK_backslash", LONG2NUM(XK_backslash));
  rb_define_const(rb_mLibX11, "XK_bracketright", LONG2NUM(XK_bracketright));
  rb_define_const(rb_mLibX11, "XK_asciicircum", LONG2NUM(XK_asciicircum));
  rb_define_const(rb_mLibX11, "XK_underscore", LONG2NUM(XK_underscore));
  rb_define_const(rb_mLibX11, "XK_grave", LONG2NUM(XK_grave));
  rb_define_const(rb_mLibX11, "XK_quoteleft", LONG2NUM(XK_quoteleft));
  rb_define_const(rb_mLibX11, "XK_a", LONG2NUM(XK_a));
  rb_define_const(rb_mLibX11, "XK_b", LONG2NUM(XK_b));
  rb_define_const(rb_mLibX11, "XK_c", LONG2NUM(XK_c));
  rb_define_const(rb_mLibX11, "XK_d", LONG2NUM(XK_d));
  rb_define_const(rb_mLibX11, "XK_e", LONG2NUM(XK_e));
  rb_define_const(rb_mLibX11, "XK_f", LONG2NUM(XK_f));
  rb_define_const(rb_mLibX11, "XK_g", LONG2NUM(XK_g));
  rb_define_const(rb_mLibX11, "XK_h", LONG2NUM(XK_h));
  rb_define_const(rb_mLibX11, "XK_i", LONG2NUM(XK_i));
  rb_define_const(rb_mLibX11, "XK_j", LONG2NUM(XK_j));
  rb_define_const(rb_mLibX11, "XK_k", LONG2NUM(XK_k));
  rb_define_const(rb_mLibX11, "XK_l", LONG2NUM(XK_l));
  rb_define_const(rb_mLibX11, "XK_m", LONG2NUM(XK_m));
  rb_define_const(rb_mLibX11, "XK_n", LONG2NUM(XK_n));
  rb_define_const(rb_mLibX11, "XK_o", LONG2NUM(XK_o));
  rb_define_const(rb_mLibX11, "XK_p", LONG2NUM(XK_p));
  rb_define_const(rb_mLibX11, "XK_q", LONG2NUM(XK_q));
  rb_define_const(rb_mLibX11, "XK_r", LONG2NUM(XK_r));
  rb_define_const(rb_mLibX11, "XK_s", LONG2NUM(XK_s));
  rb_define_const(rb_mLibX11, "XK_t", LONG2NUM(XK_t));
  rb_define_const(rb_mLibX11, "XK_u", LONG2NUM(XK_u));
  rb_define_const(rb_mLibX11, "XK_v", LONG2NUM(XK_v));
  rb_define_const(rb_mLibX11, "XK_w", LONG2NUM(XK_w));
  rb_define_const(rb_mLibX11, "XK_x", LONG2NUM(XK_x));
  rb_define_const(rb_mLibX11, "XK_y", LONG2NUM(XK_y));
  rb_define_const(rb_mLibX11, "XK_z", LONG2NUM(XK_z));
  rb_define_const(rb_mLibX11, "XK_braceleft", LONG2NUM(XK_braceleft));
  rb_define_const(rb_mLibX11, "XK_bar", LONG2NUM(XK_bar));
  rb_define_const(rb_mLibX11, "XK_braceright", LONG2NUM(XK_braceright));
  rb_define_const(rb_mLibX11, "XK_asciitilde", LONG2NUM(XK_asciitilde));

  // GrabPointer, GrabButton, GrabKeyboard, GrabKey Modes
  rb_define_const(rb_mLibX11, "GRAB_MODE_SYNC", INT2FIX(GrabModeSync));
  rb_define_const(rb_mLibX11, "GRAB_MODE_ASYNC", INT2FIX(GrabModeAsync));
}
