module LibX11
  module Xlib
    class XFontProp < FFI::Struct
      layout(
        :name,   :Atom,
        :card32, :ulong,
      )
    end
  end
end
