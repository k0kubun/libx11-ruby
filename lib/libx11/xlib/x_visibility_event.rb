module LibX11
  module Xlib
    class XVisibilityEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :window,     :Window,
        :state,      :int,
      )
    end
  end
end
