module LibX11
  module Xlib
    class XmbTextItem < FFI::Struct
      layout(
        :chars,    :string,
        :nchars,   :int,
        :delta,    :int,
        :font_set, :pointer,
      )
    end
  end
end
