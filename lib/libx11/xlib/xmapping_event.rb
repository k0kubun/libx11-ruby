module LibX11
  module Xlib
    class XMappingEvent < FFI::Struct
      layout(
        :type,          :int,
        :serial,        :ulong,
        :send_event,    :Bool,
        :display,       Display.ptr,
        :window,        :Window,
        :request,       :int,
        :first_keycode, :int,
        :count,         :int,
      )
    end
  end
end
