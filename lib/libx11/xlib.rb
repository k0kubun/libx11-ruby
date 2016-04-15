module LibX11
  module Xlib
    extend FFI::Library

    ffi_lib 'X11'

    typedef :int,   :Bool
    typedef :ulong, :Atom
    typedef :ulong, :Time
    typedef :ulong, :XID
    typedef :XID,   :Colormap
    typedef :XID,   :Drawable
    typedef :XID,   :Window

    autoload :Display, 'libx11/xlib/display'
    autoload :XEvent,  'libx11/xlib/xevent'

    attach_function :XOpenDisplay,        [:string], Display.ptr              # L1483
    attach_function :XCreateSimpleWindow, [Display.ptr, :Window, :int, :int, :uint, :uint, :uint, :ulong, :ulong], :Window # L1621
    attach_function :XDefaultRootWindow,  [Display.ptr], :Window              # L1769
    attach_function :XBlackPixel,         [Display.ptr, :int], :ulong         # L1789
    attach_function :XWhitePixel,         [Display.ptr, :int], :ulong         # L1793
    attach_function :XCloseDisplay,       [Display.ptr], :int                 # L2160
    attach_function :XDefaultScreen,      [Display.ptr], :int                 # L2227
    attach_function :XDestroyWindow,      [Display.ptr, :Window], :int        # L2243
    attach_function :XMapWindow,          [Display.ptr, :Window], :int        # L2806
    attach_function :XNextEvent,          [Display.ptr, XEvent.ptr], :int     # L2841
    attach_function :XSelectInput,        [Display.ptr, :Window, :long], :int # L3129
  end
end
