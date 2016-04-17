module LibX11
  module Xlib
    class XMapEvent < FFI::Struct
      layout(
        :type,              :int,
        :serial,            :ulong,
        :send_event,        :Bool,
        :display,           Display.ptr,
        :event,             :Window,
        :window,            :Window,
        :override_redirect, :Bool
      )
    end
  end
end
