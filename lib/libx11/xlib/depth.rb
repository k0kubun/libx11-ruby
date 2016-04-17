module LibX11
  module Xlib
    class Depth < FFI::Struct
      layout(
        :depth,    :int,
        :nvisuals, :int,
        :visuals,  :pointer,
      )
    end
  end
end
