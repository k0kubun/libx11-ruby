module LibX11
  module Xlib
    class Screen < FFI::Struct
      layout(
        :ext_data,        :pointer,
        :display,         Display.ptr,
        :root,            :Window,
        :width,           :int,
        :height,          :int,
        :mwidth,          :int,
        :mheight,         :int,
        :ndepths,         :int,
        :depths,          Depth.ptr,
        :root_depth,      :int,
        :root_visual,     Visual.ptr,
        :default_gc,      :GC,
        :cmap,            :Colormap,
        :white_pixel,     :ulong,
        :black_pixel,     :ulong,
        :max_maps,        :int,
        :min_maps,        :int,
        :backing_store,   :int,
        :save_unders,     :bool,
        :root_input_mask, :long,
      )
    end
  end
end
