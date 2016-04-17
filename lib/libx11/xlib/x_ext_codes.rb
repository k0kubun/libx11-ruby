module LibX11
  module Xlib
    class XExtCodes < FFI::Struct
      layout(
        :extension,    :int,
        :major_opcode, :int,
        :first_event,  :int,
        :first_error,  :int,
      )
    end
  end
end
