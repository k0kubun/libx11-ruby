module LibX11
  module Xlib
    class XIMValuesList < FFI::Struct
      layout(
        :count_values,     :ushort,
        :supported_values, :pointer,
      )
    end
  end
end
