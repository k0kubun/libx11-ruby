module LibX11
  module Xlib
    class XNoExposeEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :drawable,   :Drawable,
        :major_code, :int,
        :minor_code, :int,
      )
    end
  end
end
