module LibX11
  module Xlib
    class XIMCallback < FFI::Struct
      layout(
        :client_data, :XPointer,
        :callback,    :XIMProc,
      )
    end
  end
end
