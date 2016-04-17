module LibX11
  module Xlib
    class XSetWindowAttributes < FFI::Struct
      layout(
        :background_pixmap,     :Pixmap,
        :background_pixel,      :ulong,
        :border_pixmap,         :Pixmap,
        :border_pixel,          :ulong,
        :bit_gravity,           :int,
        :win_gravity,           :int,
        :backing_store,         :int,
        :backing_planes,        :ulong,
        :backing_pixel,         :ulong,
        :save_under,            :bool,
        :event_mask,            :long,
        :do_not_propagate_mask, :long,
        :override_redirect,     :bool,
        :colormap,              :Colormap,
        :cursor,                :Cursor,
      )
    end
  end
end
