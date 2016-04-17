module LibX11
  module Xlib
    class XWindowAttributes < FFI::Struct
      layout(
        :x,                     :int,
        :y,                     :int,
        :width,                 :int,
        :height,                :int,
        :border_width,          :int,
        :depth,                 :int,
        :visual,                :pointer,
        :root,                  :Window,
        :class,                 :int,
        :bit_gravity,           :int,
        :win_gravity,           :int,
        :backing_store,         :int,
        :backing_planes,        :ulong,
        :backing_pixel,         :ulong,
        :save_under,            :bool,
        :colormap,              :Colormap,
        :map_installed,         :bool,
        :map_state,             :int,
        :all_event_masks,       :long,
        :your_event_mask,       :long,
        :do_not_propagate_mask, :long,
        :override_redirect,     :bool,
        :screen,                :pointer,
      )
    end
  end
end
