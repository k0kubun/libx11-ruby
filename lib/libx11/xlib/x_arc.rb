module LibX11
  module Xlib
    class XArc < FFI::Struct
      layout(
        :x,      :short,
        :y,      :short,
        :width,  :ushort,
        :height, :ushort,
        :angle1, :short,
        :angle2, :short,
      )
    end
  end
end
