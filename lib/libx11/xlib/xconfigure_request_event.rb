module LibX11
  module Xlib
    class XConfigureRequestEvent < FFI::Struct
      layout(
        :type,         :int,
        :serial,       :ulong,
        :send_event,   :Bool,
        :display,      Display.ptr,
        :event,        :Window,
        :window,       :Window,
        :x,            :int,
        :y,            :int,
        :width,        :int,
        :height,       :int,
        :border_width, :int,
        :above,        :Window,
        :detail,       :int,
        :value_mask,   :ulong,
      )
    end
  end
end
