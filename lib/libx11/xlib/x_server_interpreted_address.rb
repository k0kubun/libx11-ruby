module LibX11
  module Xlib
    class XServerInterpretedAddress < FFI::Struct
      layout(
        :typelength,  :int,
        :valuelength, :int,
        :type,        :string,
        :value,       :string,
      )
    end
  end
end
