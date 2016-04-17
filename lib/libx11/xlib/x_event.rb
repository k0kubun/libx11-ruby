require 'libx11/xlib/x_any_event'
require 'libx11/xlib/x_button_event'
require 'libx11/xlib/x_circulate_event'
require 'libx11/xlib/x_circulate_request_event'
require 'libx11/xlib/x_client_message_event'
require 'libx11/xlib/x_colormap_event'
require 'libx11/xlib/x_configure_event'
require 'libx11/xlib/x_configure_request_event'
require 'libx11/xlib/x_create_window_event'
require 'libx11/xlib/x_crossing_event'
require 'libx11/xlib/x_destroy_window_event'
require 'libx11/xlib/x_error_event'
require 'libx11/xlib/x_expose_event'
require 'libx11/xlib/x_focus_change_event'
require 'libx11/xlib/x_generic_event'
require 'libx11/xlib/x_generic_event_cookie'
require 'libx11/xlib/x_graphics_expose_event'
require 'libx11/xlib/x_gravity_event'
require 'libx11/xlib/x_key_event'
require 'libx11/xlib/x_keymap_event'
require 'libx11/xlib/x_map_event'
require 'libx11/xlib/x_map_request_event'
require 'libx11/xlib/x_mapping_event'
require 'libx11/xlib/x_motion_event'
require 'libx11/xlib/x_no_expose_event'
require 'libx11/xlib/x_property_event'
require 'libx11/xlib/x_reparent_event'
require 'libx11/xlib/x_resize_request_event'
require 'libx11/xlib/x_selection_clear_event'
require 'libx11/xlib/x_selection_event'
require 'libx11/xlib/x_selection_request_event'
require 'libx11/xlib/x_unmap_event'
require 'libx11/xlib/x_visibility_event'

module LibX11
  module Xlib
    class XEvent < FFI::Union
      layout(
        :type,              :int,
        :xany,              XAnyEvent,
        :xkey,              XKeyEvent,
        :xbutton,           XButtonEvent,
        :xmotion,           XMotionEvent,
        :xcrossing,         XCrossingEvent,
        :xfocus,            XFocusChangeEvent,
        :xexpose,           XExposeEvent,
        :xgraphicsexpose,   XGraphicsExposeEvent,
        :xnoexpose,         XNoExposeEvent,
        :xvisibility,       XVisibilityEvent,
        :xcreatewindow,     XCreateWindowEvent,
        :xdestroywindow,    XDestroyWindowEvent,
        :xunmap,            XUnmapEvent,
        :xmap,              XMapEvent,
        :xmaprequest,       XMapRequestEvent,
        :xreparent,         XReparentEvent,
        :xconfigure,        XConfigureEvent,
        :xgravity,          XGravityEvent,
        :xresizerequest,    XResizeRequestEvent,
        :xconfigurerequest, XConfigureRequestEvent,
        :xcirculate,        XCirculateEvent,
        :xcirculaterequest, XCirculateRequestEvent,
        :xproperty,         XPropertyEvent,
        :xselectionclear,   XSelectionClearEvent,
        :xselectionrequest, XSelectionRequestEvent,
        :xselection,        XSelectionEvent,
        :xcolormap,         XColormapEvent,
        :xclient,           XClientMessageEvent,
        :xmapping,          XMappingEvent,
        :xerror,            XErrorEvent,
        :xkeymap,           XKeymapEvent,
        :xgeneric,          XGenericEvent,
        :xcookie,           XGenericEventCookie,
        :pad,               [:long, 24],
      )
    end
  end
end
