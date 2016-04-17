module LibX11
  module Xlib
    class XWindowChanges < FFI::Struct
      layout(
        :x,            :int,
        :y,            :int,
        :width,        :int,
        :height,       :int,
        :border_width, :int,
        :sibling,      :Window,
        :stack_mode,   :int,
      )
    end
  end
end
