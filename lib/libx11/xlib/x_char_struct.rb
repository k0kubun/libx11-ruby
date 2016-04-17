module LibX11
  module Xlib
    class XCharStruct < FFI::Struct
      layout(
        :lbearing,   :short,
        :rbearing,   :short,
        :width,      :short,
        :ascent,     :short,
        :descent,    :short,
        :attributes, :ushort,
      )
    end
  end
end
