module LibX11
  module Xlib
    class XSelectionClearEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :window,     :Window,
        :selection,  :Atom,
        :time,       :Time,
      )
    end
  end
end
