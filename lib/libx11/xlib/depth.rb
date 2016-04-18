module LibX11
  module Xlib
    class Depth < FFI::Struct
      layout(
        :depth,    :int,
        :nvisuals, :int,
        :visuals,  Visual.ptr,
      )
    end
  end
end
