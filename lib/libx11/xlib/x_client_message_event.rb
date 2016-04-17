module LibX11
  module Xlib
    class XClientMessageEvent < FFI::Struct
      class Data < FFI::Union
        layout(
          :b, [:char, 20],
          :s, [:short, 10],
          :l, [:long, 5],
        )
      end

      layout(
        :type,         :int,
        :serial,       :ulong,
        :send_event,   :Bool,
        :display,      :pointer,
        :window,       :Window,
        :message_type, :Atom,
        :format,       :int,
        :data,         Data,
      )
    end
  end
end
