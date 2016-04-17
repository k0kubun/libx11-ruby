module LibX11
  module Xlib
    class Visual < FFI::Struct
      layout(
        :ext_data,     :pointer,
        :visualid,     :VisualID,
        :class,        :int,
        :red_mask,     :ulong,
        :green_mask,   :ulong,
        :blue_mask,    :ulong,
        :bits_per_rgb, :int,
        :map_entries,  :int,
      )
    end
  end
end
