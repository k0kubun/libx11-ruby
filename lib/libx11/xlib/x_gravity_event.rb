module LibX11
  module Xlib
    class XGravityEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :event,      :Window,
        :window,     :Window,
        :x,          :int,
        :y,          :int,
      )
    end
  end
end
