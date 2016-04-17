module LibX11
  module Xlib
    class XICCallback < FFI::Struct
      layout(
        :client_data, :XPointer,
        :callback,    :XICProc,
      )
    end
  end
end
