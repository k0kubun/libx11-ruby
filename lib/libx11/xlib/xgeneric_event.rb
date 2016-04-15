module LibX11
  module Xlib
    class XGenericEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :extension,  :int,
        :evtype,     :int,
      )
    end
  end
end
