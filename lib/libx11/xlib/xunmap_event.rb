module LibX11
  module Xlib
    class XUnmapEvent < FFI::Struct
      layout(
        :type,           :int,
        :serial,         :ulong,
        :send_event,     :Bool,
        :display,        Display.ptr,
        :event,          :Window,
        :window,         :Window,
        :from_configure, :Bool,
      )
    end
  end
end
