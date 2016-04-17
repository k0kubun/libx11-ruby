module LibX11
  module Xlib
    class XKeyEvent < FFI::Struct
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
        :state,       :uint,
        :keycode,     :uint,
        :same_screen, :bool,
      )
    end
  end
end
