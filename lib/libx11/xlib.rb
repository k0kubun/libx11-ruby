module LibX11
  module Xlib
    extend FFI::Library

    ffi_lib 'X11'

    typedef :ulong, :XID

    autoload :Display, 'libx11/xlib/display'

    attach_function :XOpenDisplay, [:string], Display.ptr
    attach_function :XCloseDisplay, [Display.ptr], :int
  end
end
