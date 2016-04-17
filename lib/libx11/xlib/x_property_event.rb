module LibX11
  module Xlib
    class XPropertyEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :window,     :Window,
        :atom,       :Atom,
        :time,       :Time,
        :state,      :int,
      )
    end
  end
end
