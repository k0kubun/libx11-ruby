module Typesym
  def self.typesym(type)
    type = type.gsub(/ +\*\z/, '*').gsub(/ +\*\*\z/, '**')
    case type
    when 'Display*', 'XKeyEvent*', 'XEvent*', 'XMappingEvent*',
      'XGenericEventCookie*', 'Depth*', 'XFontProp*', 'XIMStyle*'
      type.sub(/ ?\*\z/, '').concat('.ptr')
    when 'XFontStruct*', 'XTimeCoord*', 'XModifierKeymap*', 'Visual*', 'XImage*',
      'XColor*', 'XGCValues*', 'XSetWindowAttributes*', 'XHostAddress*', 'Screen*',
      'XExtCodes*', 'XExtData*', 'XPixmapFormatValues*', 'XWindowChanges*',
      'XKeyboardControl*', 'XArc*', 'XChar2b*', 'XPoint*', 'XRectangle*', 'XSegment*',
      'XTextItem*', 'XTextItem16*', 'XKeyboardState*', 'XWindowAttributes*',
      'XCharStruct*', 'XOM', 'XOC', 'XFontSet', 'XFontSetExtents*',
      'XmbTextItem*', 'XwcTextItem*', 'XIM', 'XIC', 'XKeyPressedEvent*', 'XOrientation*'
      ':pointer'
    when 'XID', 'Window', 'Time', 'KeyCode', 'int', 'Status', 'Drawable', 'void', 'Atom',
      'KeySym', 'Colormap', 'Pixmap', 'Cursor', 'Font', 'GC', 'GContext', 'long',
      'VisualID', 'XPointer', 'XIDProc', 'XConnectionWatchProc', 'XErrorHandler',
      'XIOErrorHandler', 'char', 'short', 'unsigned', 'XOrientation', 'XIMProc', 'XICProc'
      ":#{type}"
    when 'char*', 'const char*'
      ':string'
    when 'int*', 'Atom*', 'char**', 'Colormap*', 'XFontStruct**', 'Bool*', 'KeySym*',
      'char **', 'XExtData**', 'Atom**', 'char***', 'Window**', 'Window*', 'struct _XExtData**',
      'unsigned long*', 'unsigned char*', 'void*', 'unsigned int*', 'unsigned char**', 'Pixmap*',
      'struct _XrmHashBucketRec*', 'XFontStruct***', 'wchar_t*', 'Status*', 'int**', 'wchar_t', 'char [32]',
      'KeyCode*'
      ':pointer'
    when 'unsigned int'
      ':uint'
    when 'unsigned long'
      ':ulong'
    when 'unsigned short'
      ':ushort'
    when 'Bool'
      ':bool'
    when 'unsigned char'
      ':uchar'
    when 'XEDataObject'
      'XEDataObject.by_value'
    when 'struct _XDisplay*'
      'Display.ptr'
    when 'XRectangle', 'XCharStruct'
      type
    else
      raise "Unprocessible type name: '#{type}'"
    end
  end
end
