module LibX11
  module Xlib
    class XMapRequestEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :parent,     :Window,
        :window,     :Window,
      )
    end
  end
end
