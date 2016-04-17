module LibX11
  module Xlib
    class XGCValues < FFI::Struct
      layout(
        :function,           :int,
        :plane_mask,         :ulong,
        :foreground,         :ulong,
        :background,         :ulong,
        :line_width,         :int,
        :line_style,         :int,
        :cap_style,          :int,
        :join_style,         :int,
        :fill_style,         :int,
        :fill_rule,          :int,
        :arc_mode,           :int,
        :tile,               :Pixmap,
        :stipple,            :Pixmap,
        :ts_x_origin,        :int,
        :ts_y_origin,        :int,
        :font,               :Font,
        :subwindow_mode,     :int,
        :graphics_exposures, :bool,
        :clip_x_origin,      :int,
        :clip_y_origin,      :int,
        :clip_mask,          :Pixmap,
        :dash_offset,        :int,
        :dashes,             :char,
      )
    end
  end
end
