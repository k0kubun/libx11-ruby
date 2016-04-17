module LibX11
  module Xlib
    class XDestroyWindowEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :event,      :Window,
        :window,     :Window,
      )
    end
  end
end
