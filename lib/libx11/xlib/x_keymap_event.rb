module LibX11
  module Xlib
    class XKeymapEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :Bool,
        :display,    Display.ptr,
        :window,     :Window,
        :key_vector, [:char, 32],
      )
    end
  end
end
