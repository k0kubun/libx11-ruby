module LibX11
  module Xlib
    class XReparentEvent < FFI::Struct
      layout(
        :type,              :int,
        :serial,            :ulong,
        :send_event,        :Bool,
        :display,           Display.ptr,
        :event,             :Window,
        :window,            :Window,
        :parent,            :Window,
        :x,                 :int,
        :y,                 :int,
        :override_redirect, :Bool,
      )
    end
  end
end
