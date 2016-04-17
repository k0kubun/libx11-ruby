module LibX11
  module Xlib
    class XGenericEventCookie < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :extension,  :int,
        :evtype,     :int,
        :cookie,     :uint,
        :data,       :pointer,
      )
    end
  end
end
