module LibX11
  module Xlib
    class XConfigureEvent < FFI::Struct
      layout(
        :type,              :int,
        :serial,            :ulong,
        :send_event,        :bool,
        :display,           Display.ptr,
        :event,             :Window,
        :window,            :Window,
        :x,                 :int,
        :y,                 :int,
        :width,             :int,
        :height,            :int,
        :border_width,      :int,
        :above,             :Window,
        :override_redirect, :bool,
      )
    end
  end
end
