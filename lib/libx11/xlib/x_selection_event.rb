module LibX11
  module Xlib
    class XSelectionEvent < FFI::Struct
      layout(
        :type,       :int,
        :serial,     :ulong,
        :send_event, :bool,
        :display,    Display.ptr,
        :requestor,  :Window,
        :selection,  :Atom,
        :target,     :Atom,
        :property,   :Atom,
        :time,       :Time,
      )
    end
  end
end
