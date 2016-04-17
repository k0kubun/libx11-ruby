module LibX11
  module Xlib
    class XOMCharSetList < FFI::Struct
      layout(
        :charset_count, :int,
        :charset_list,  :pointer,
      )
    end
  end
end
