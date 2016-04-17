module LibX11
  module Xlib
    class XTextItem < FFI::Struct
      layout(
        :chars,  :string,
        :nchars, :int,
        :delta,  :int,
        :font,   :Font,
      )
    end
  end
end
