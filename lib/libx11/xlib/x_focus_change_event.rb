module LibX11
  module Xlib
    class XFocusChangeEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :window,     :Window,
        :mode,       :int,
        :detail,     :int
      )
    end
  end
end
