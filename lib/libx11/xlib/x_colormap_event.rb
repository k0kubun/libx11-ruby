module LibX11
  module Xlib
    class XColormapEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :window,     :Window,
        :colormap,   :Colormap,
        :new,        :Bool,
        :state,      :int,
      )
    end
  end
end
