module LibX11
  module Xlib
    class XCreateWindowEvent < FFI::Struct
      layout(
        :type,              :int,
        :serial,            :ulong,
        :send_event,        :bool,
        :display,           Display.ptr,
        :parent,            :Window,
        :window,            :Window,
        :x,                 :int,
        :y,                 :int,
        :width,             :int,
        :height,            :int,
        :border_width,      :int,
        :override_redirect, :bool,
      )
    end
  end
end
