module LibX11
  module Xlib
    class XResizeRequestEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :window,     :Window,
        :width,      :int,
        :height,     :int,
      )
    end
  end
end
