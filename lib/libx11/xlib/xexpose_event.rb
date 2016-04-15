module LibX11
  module Xlib
    class XExposeEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :window,     :Window,
        :x,          :int,
        :y,          :int,
        :width,      :int,
        :height,     :int,
        :count,      :int,
      )
    end
  end
end
