module LibX11
  module Xlib
    class XRectangle < FFI::Struct
      layout(
        :x,      :short,
        :y,      :short,
        :width,  :ushort,
        :height, :ushort,
      )
    end
  end
end
