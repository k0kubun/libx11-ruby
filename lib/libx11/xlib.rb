module LibX11
  module Xlib
    extend FFI::Library

    ffi_lib 'X11'

    typedef :int,    :Bool
    typedef :int,    :Status
    typedef :string, :XPointer
    typedef :uchar,  :KeyCode
    typedef :ulong,  :Atom
    typedef :ulong,  :Time
    typedef :ulong,  :VisualID
    typedef :ulong,  :XID
    typedef :XID,    :Colormap
    typedef :XID,    :Cursor
    typedef :XID,    :Drawable
    typedef :XID,    :Font
    typedef :XID,    :GC
    typedef :XID,    :GContext
    typedef :XID,    :KeySym
    typedef :XID,    :Pixmap
    typedef :XID,    :Window

    require 'libx11/xlib/display'
    require 'libx11/xlib/xevent'

    callback :XConnectionWatchProc, [Display.ptr, :XPointer, :int, :bool, :pointer], :void
    callback :XErrorHandler, [Display.ptr, XErrorEvent.ptr], :int
    callback :XIDProc, [Display.ptr, :XPointer, :XPointer], :void
    callback :XIOErrorHandler, [Display.ptr], :int

    attach_function :XOpenDisplay, [:string], Display.ptr
    attach_function :XCreateSimpleWindow, [Display.ptr, :Window, :int, :int, :uint, :uint, :uint, :ulong, :ulong], :Window
    attach_function :XLookupKeysym, [XKeyEvent.ptr, :int], :KeySym
    attach_function :XDefaultRootWindow, [Display.ptr], :Window
    attach_function :XBlackPixel, [Display.ptr, :int], :ulong
    attach_function :XWhitePixel, [Display.ptr, :int], :ulong
    attach_function :XDisplayString, [Display.ptr], :string
    attach_function :XSetErrorHandler, [:XErrorHandler], :XErrorHandler
    attach_function :XCloseDisplay, [Display.ptr], :int
    attach_function :XConnectionNumber, [Display.ptr], :int
    attach_function :XDefaultScreen, [Display.ptr], :int
    attach_function :XDestroyWindow, [Display.ptr, :Window], :int
    attach_function :XGrabKey, [Display.ptr, :int, :uint, :Window, :bool, :int, :int], :int
    attach_function :XKeysymToKeycode, [Display.ptr, :KeySym], :KeyCode
    attach_function :XMapWindow, [Display.ptr, :Window], :int
    attach_function :XNextEvent, [Display.ptr, XEvent.ptr], :int, blocking: true
    attach_function :XSelectInput, [Display.ptr, :Window, :long], :int
    attach_function :XSync, [Display.ptr, :bool], :int, blocking: true
    attach_function :XUngrabKey, [Display.ptr, :int, :uint, :Window], :int
  end
end
