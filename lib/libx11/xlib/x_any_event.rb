module LibX11
  module Xlib
    class XAnyEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :window,     :Window,
      )
    end
  end
end
