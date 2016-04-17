module LibX11
  module Xlib
    class XKeyboardControl < FFI::Struct
      layout(
        :key_click_percent, :int,
        :bell_percent,      :int,
        :bell_pitch,        :int,
        :bell_duration,     :int,
        :led,               :int,
        :led_mode,          :int,
        :key,               :int,
        :auto_repeat_mode,  :int,
      )
    end
  end
end
