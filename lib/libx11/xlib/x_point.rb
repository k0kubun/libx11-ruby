module LibX11
  module Xlib
    class XPoint < FFI::Struct
      layout(
        :x, :short,
        :y, :short,
      )
    end
  end
end
