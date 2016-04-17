module LibX11
  module Xlib
    class XCrossingEvent < FFI::Struct
      layout(
        :type,        :int,
        :serial,      :ulong,
        :send_event,  :bool,
        :display,     Display.ptr,
        :window,      :Window,
        :root,        :Window,
        :subwindow,   :Window,
        :time,        :Time,
        :x,           :int,
        :y,           :int,
        :x_root,      :int,
        :y_root,      :int,
        :mode,        :int,
        :detail,      :int,
        :same_screen, :bool,
        :focus,       :bool,
        :state,       :uint,
      )
    end
  end
end
