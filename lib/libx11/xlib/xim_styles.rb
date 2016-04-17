module LibX11
  module Xlib
    class XIMStyles < FFI::Struct
      layout(
        :count_styles,     :ushort,
        :supported_styles, :pointer,
      )
    end
  end
end
