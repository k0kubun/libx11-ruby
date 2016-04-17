module LibX11
  module Xlib
    class XReparentEvent < FFI::Struct
      layout(
        :type,              :int,
        :serial,            :ulong,
        :send_event,        :bool,
        :display,           Display.ptr,
        :event,             :Window,
        :window,            :Window,
        :parent,            :Window,
        :x,                 :int,
        :y,                 :int,
        :override_redirect, :bool,
      )
    end
  end
end
