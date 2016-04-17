module LibX11
  module Xlib
    class XOMOrientation < FFI::Struct
      layout(
        :num_orientation, :int,
        :orientation,     :pointer,
      )
    end
  end
end
