module LibX11
  module Xlib
    class XEDataObject < FFI::Union
      layout(
        :display,       Display.ptr,
        :gc,            :GC,
        :visual,        :pointer,
        :screen,        :pointer,
        :pixmap_format, :pointer,
        :font,          :pointer,
      )
    end
  end
end
