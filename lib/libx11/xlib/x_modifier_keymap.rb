module LibX11
  module Xlib
    class XModifierKeymap < FFI::Struct
      layout(
        :max_keypermod, :int,
        :modifiermap,   :pointer,
      )
    end
  end
end
