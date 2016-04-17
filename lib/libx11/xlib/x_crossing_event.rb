module LibX11
  module Xlib
    class XCrossingEvent < FFI::Struct
      layout(
        :type,        :int,
        :serial,      :ulong,
        :send_event,  :Bool,
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
        :same_screen, :Bool,
        :focus,       :Bool,
        :state,       :uint
      )
    end
  end
end
