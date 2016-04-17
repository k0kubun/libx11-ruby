module LibX11
  module Xlib
    class XHostAddress < FFI::Struct
      layout(
        :family,  :int,
        :length,  :int,
        :address, :string,
      )
    end
  end
end
