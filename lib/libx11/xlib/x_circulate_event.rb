module LibX11
  module Xlib
    class XCirculateEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :event,      :Window,
        :window,     :Window,
        :place,      :int,
      )
    end
  end
end
