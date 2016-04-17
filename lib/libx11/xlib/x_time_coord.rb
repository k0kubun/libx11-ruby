module LibX11
  module Xlib
    class XTimeCoord < FFI::Struct
      layout(
        :time, :Time,
        :x,    :short,
        :y,    :short,
      )
    end
  end
end
