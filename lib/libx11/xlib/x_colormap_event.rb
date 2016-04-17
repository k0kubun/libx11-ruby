module LibX11
  module Xlib
    class XColormapEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :window,     :Window,
        :colormap,   :Colormap,
        :new,        :bool,
        :state,      :int,
      )
    end
  end
end
