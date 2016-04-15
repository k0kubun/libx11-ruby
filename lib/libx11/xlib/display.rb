module LibX11
  module Xlib
    class Display < FFI::Struct
      layout(
        :ext_data,            :pointer,
        :private1,            :pointer,
        :fd,                  :int,
        :private2,            :int,
        :proto_major_version, :int,
        :proto_minor_version, :int,
        :vendor,              :string,
        :private3,            :XID,
        :private4,            :XID,
        :private5,            :XID,
        :private6,            :int,
        :resource_alloc,      :pointer,
        :byte_order,          :int,
        :bitmap_unit,         :int,
        :bitmap_pad,          :int,
        :bitmap_bit_order,    :int,
        :nformats,            :int,
        :pixmap_format,       :pointer,
        :private8,            :int,
        :release,             :int,
        :private9,            :pointer,
        :private10,           :pointer,
        :qlen,                :int,
        :last_request_read,   :ulong,
        :request,             :ulong,
        :private11,           :pointer,
        :private12,           :pointer,
        :private13,           :pointer,
        :private14,           :pointer,
        :max_request_size,    :uint,
        :db,                  :pointer,
        :private15,           :pointer,
        :display_name,        :string,
        :default_screen,      :int,
        :nscreens,            :int,
        :screens,             :pointer,
        :motion_buffer,       :ulong,
        :private16,           :ulong,
        :min_keycode,         :int,
        :max_keycode,         :int,
        :private17,           :pointer,
        :private18,           :pointer,
        :private19,           :int,
        :xdefaults,           :string
      )
    end
  end
end