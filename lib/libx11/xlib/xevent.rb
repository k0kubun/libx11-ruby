require 'libx11/xlib/xany_event'
require 'libx11/xlib/xbutton_event'
require 'libx11/xlib/xcirculate_event'
require 'libx11/xlib/xcirculate_request_event'
require 'libx11/xlib/xclient_message_event'
require 'libx11/xlib/xcolormap_event'
require 'libx11/xlib/xconfigure_event'
require 'libx11/xlib/xconfigure_request_event'
require 'libx11/xlib/xcreate_window_event'
require 'libx11/xlib/xcrossing_event'
require 'libx11/xlib/xdestroy_window_event'
require 'libx11/xlib/xerror_event'
require 'libx11/xlib/xexpose_event'
require 'libx11/xlib/xfocus_change_event'
require 'libx11/xlib/xgeneric_event'
require 'libx11/xlib/xgeneric_event_cookie'
require 'libx11/xlib/xgraphics_expose_event'
require 'libx11/xlib/xgravity_event'
require 'libx11/xlib/xkey_event'
require 'libx11/xlib/xkeymap_event'
require 'libx11/xlib/xmap_event'
require 'libx11/xlib/xmap_request_event'
require 'libx11/xlib/xmapping_event'
require 'libx11/xlib/xmotion_event'
require 'libx11/xlib/xno_expose_event'
require 'libx11/xlib/xproperty_event'
require 'libx11/xlib/xreparent_event'
require 'libx11/xlib/xresize_request_event'
require 'libx11/xlib/xselection_clear_event'
require 'libx11/xlib/xselection_event'
require 'libx11/xlib/xselection_request_event'
require 'libx11/xlib/xunmap_event'
require 'libx11/xlib/xvisibility_event'

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
