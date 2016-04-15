module LibX11
  module Xlib
    class XErrorEvent < FFI::Struct
      layout(
        :type,         :int,
        :display,      Display.ptr,
        :resourceid,   :XID,
        :serial,       :ulong,
        :error_code,   :uchar,
        :request_code, :uchar,
        :minor_code,   :uchar,
      )
    end
  end
end
