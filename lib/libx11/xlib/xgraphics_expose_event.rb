module LibX11
  module Xlib
    class XGraphicsExposeEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :window,     :Window,
        :drawable,   :Drawable,
        :x,          :int,
        :y,          :int,
        :width,      :int,
        :height,     :int,
        :count,      :int,
        :major_code, :int,
        :minor_code, :int,
      )
    end
  end
end
