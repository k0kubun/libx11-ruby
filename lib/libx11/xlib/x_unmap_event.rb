module LibX11
  module Xlib
    class XUnmapEvent < FFI::Struct
      layout(
        :type,           :int,
        :serial,         :ulong,
        :send_event,     :bool,
        :display,        Display.ptr,
        :event,          :Window,
        :window,         :Window,
        :from_configure, :bool,
      )
    end
  end
end
