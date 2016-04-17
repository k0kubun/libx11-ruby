module LibX11
  module Xlib
    class XColor < FFI::Struct
      layout(
        :pixel, :ulong,
        :red,   :ushort,
        :green, :ushort,
        :blue,  :ushort,
        :flags, :char,
        :pad,   :char,
      )
    end
  end
end
