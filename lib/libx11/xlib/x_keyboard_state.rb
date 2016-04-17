module LibX11
  module Xlib
    class XKeyboardState < FFI::Struct
      layout(
        :key_click_percent,  :int,
        :bell_percent,       :int,
        :bell_pitch,         :uint,
        :bell_duration,      :uint,
        :led_mask,           :ulong,
        :global_auto_repeat, :int,
        :auto_repeats[32],   :char,
      )
    end
  end
end
