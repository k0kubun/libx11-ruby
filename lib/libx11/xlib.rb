module LibX11
  module Xlib
    extend FFI::Library

    ffi_lib 'X11'

    typedef :int,    :Bool
    typedef :int,    :Status
    typedef :string, :XPointer
    typedef :uchar,  :KeyCode
    typedef :ulong,  :Atom
    typedef :ulong,  :Time
    typedef :ulong,  :VisualID
    typedef :ulong,  :XID
    typedef :XID,    :Colormap
    typedef :XID,    :Cursor
    typedef :XID,    :Drawable
    typedef :XID,    :Font
    typedef :XID,    :GC
    typedef :XID,    :GContext
    typedef :XID,    :KeySym
    typedef :XID,    :Pixmap
    typedef :XID,    :Window

    require 'libx11/xlib/display'
    require 'libx11/xlib/x_edata_object'
    require 'libx11/xlib/x_event'

    callback :XConnectionWatchProc, [Display.ptr, :XPointer, :int, :bool, :pointer], :void
    callback :XErrorHandler, [Display.ptr, XErrorEvent.ptr], :int
    callback :XIDProc, [Display.ptr, :XPointer, :XPointer], :void
    callback :XIOErrorHandler, [Display.ptr], :int

    attach_function :XLoadQueryFont, [Display.ptr, :string], :pointer
    attach_function :XQueryFont, [Display.ptr, :XID], :pointer
    attach_function :XGetMotionEvents, [Display.ptr, :Window, :Time, :Time, :pointer], :pointer
    attach_function :XDeleteModifiermapEntry, [:pointer, :KeyCode, :int], :pointer
    attach_function :XNewModifiermap, [:int], :pointer
    attach_function :XCreateImage, [Display.ptr, :pointer, :uint, :int, :int, :string, :uint, :uint, :int, :int], :pointer
    attach_function :XInitImage, [:pointer], :Status
    attach_function :XGetImage, [Display.ptr, :Drawable, :int, :int, :uint, :uint, :ulong, :int], :pointer
    attach_function :XGetSubImage, [Display.ptr, :Drawable, :int, :int, :uint, :uint, :ulong, :int, :pointer, :int, :int], :pointer
    attach_function :XOpenDisplay, [:string], Display.ptr
    attach_function :XrmInitialize, [], :void
    attach_function :XFetchBytes, [Display.ptr, :pointer], :string
    attach_function :XFetchBuffer, [Display.ptr, :pointer, :int], :string
    attach_function :XGetAtomName, [Display.ptr, :Atom], :string
    attach_function :XGetAtomNames, [Display.ptr, :pointer, :int, :pointer], :Status
    attach_function :XGetDefault, [Display.ptr, :string, :string], :string
    attach_function :XDisplayName, [:string], :string
    attach_function :XKeysymToString, [:KeySym], :string
    attach_function :XInternAtom, [Display.ptr, :string, :bool], :Atom
    attach_function :XInternAtoms, [Display.ptr, :pointer, :int, :bool, :pointer], :Status
    attach_function :XCopyColormapAndFree, [Display.ptr, :Colormap], :Colormap
    attach_function :XCreateColormap, [Display.ptr, :Window, :pointer, :int], :Colormap
    attach_function :XCreatePixmapCursor, [Display.ptr, :Pixmap, :Pixmap, :pointer, :pointer, :uint, :uint], :Cursor
    attach_function :XCreateGlyphCursor, [Display.ptr, :Font, :Font, :uint, :uint, :pointer, :pointer], :Cursor
    attach_function :XCreateFontCursor, [Display.ptr, :uint], :Cursor
    attach_function :XLoadFont, [Display.ptr, :string], :Font
    attach_function :XCreateGC, [Display.ptr, :Drawable, :ulong, :pointer], :GC
    attach_function :XGContextFromGC, [:GC], :GContext
    attach_function :XFlushGC, [Display.ptr, :GC], :void
    attach_function :XCreatePixmap, [Display.ptr, :Drawable, :uint, :uint, :uint], :Pixmap
    attach_function :XCreateBitmapFromData, [Display.ptr, :Drawable, :string, :uint, :uint], :Pixmap
    attach_function :XCreatePixmapFromBitmapData, [Display.ptr, :Drawable, :string, :uint, :uint, :ulong, :ulong, :uint], :Pixmap
    attach_function :XCreateSimpleWindow, [Display.ptr, :Window, :int, :int, :uint, :uint, :uint, :ulong, :ulong], :Window
    attach_function :XGetSelectionOwner, [Display.ptr, :Atom], :Window
    attach_function :XCreateWindow, [Display.ptr, :Window, :int, :int, :uint, :uint, :uint, :int, :uint, :pointer, :ulong, :pointer], :Window
    attach_function :XListInstalledColormaps, [Display.ptr, :Window, :pointer], :pointer
    attach_function :XListFonts, [Display.ptr, :string, :int, :pointer], :pointer
    attach_function :XListFontsWithInfo, [Display.ptr, :string, :int, :pointer, :pointer], :pointer
    attach_function :XGetFontPath, [Display.ptr, :pointer], :pointer
    attach_function :XListExtensions, [Display.ptr, :pointer], :pointer
    attach_function :XListProperties, [Display.ptr, :Window, :pointer], :pointer
    attach_function :XListHosts, [Display.ptr, :pointer, :pointer], :pointer
    attach_function :XKeycodeToKeysym, [Display.ptr, :KeyCode, :int], :KeySym
    attach_function :XLookupKeysym, [XKeyEvent.ptr, :int], :KeySym
    attach_function :XGetKeyboardMapping, [Display.ptr, :KeyCode, :int, :pointer], :pointer
    attach_function :XStringToKeysym, [:string], :KeySym
    attach_function :XMaxRequestSize, [Display.ptr], :long
    attach_function :XExtendedMaxRequestSize, [Display.ptr], :long
    attach_function :XResourceManagerString, [Display.ptr], :string
    attach_function :XScreenResourceString, [:pointer], :string
    attach_function :XDisplayMotionBufferSize, [Display.ptr], :ulong
    attach_function :XVisualIDFromVisual, [:pointer], :VisualID
    attach_function :XInitThreads, [], :Status
    attach_function :XLockDisplay, [Display.ptr], :void
    attach_function :XUnlockDisplay, [Display.ptr], :void
    attach_function :XInitExtension, [Display.ptr, :string], :pointer
    attach_function :XAddExtension, [Display.ptr], :pointer
    attach_function :XFindOnExtensionList, [:pointer, :int], :pointer
    attach_function :XEHeadOfExtensionList, [XEDataObject.by_value], :pointer
    attach_function :XRootWindow, [Display.ptr, :int], :Window
    attach_function :XDefaultRootWindow, [Display.ptr], :Window
    attach_function :XRootWindowOfScreen, [:pointer], :Window
    attach_function :XDefaultVisual, [Display.ptr, :int], :pointer
    attach_function :XDefaultVisualOfScreen, [:pointer], :pointer
    attach_function :XDefaultGC, [Display.ptr, :int], :GC
    attach_function :XDefaultGCOfScreen, [:pointer], :GC
    attach_function :XBlackPixel, [Display.ptr, :int], :ulong
    attach_function :XWhitePixel, [Display.ptr, :int], :ulong
    attach_function :XAllPlanes, [], :ulong
    attach_function :XBlackPixelOfScreen, [:pointer], :ulong
    attach_function :XWhitePixelOfScreen, [:pointer], :ulong
    attach_function :XNextRequest, [Display.ptr], :ulong
    attach_function :XLastKnownRequestProcessed, [Display.ptr], :ulong
    attach_function :XServerVendor, [Display.ptr], :string
    attach_function :XDisplayString, [Display.ptr], :string
    attach_function :XDefaultColormap, [Display.ptr, :int], :Colormap
    attach_function :XDefaultColormapOfScreen, [:pointer], :Colormap
    attach_function :XDisplayOfScreen, [:pointer], Display.ptr
    attach_function :XScreenOfDisplay, [Display.ptr, :int], :pointer
    attach_function :XDefaultScreenOfDisplay, [Display.ptr], :pointer
    attach_function :XEventMaskOfScreen, [:pointer], :long
    attach_function :XScreenNumberOfScreen, [:pointer], :int
    attach_function :XSetErrorHandler, [:XErrorHandler], :XErrorHandler
    attach_function :XSetIOErrorHandler, [:XIOErrorHandler], :XIOErrorHandler
    attach_function :XListPixmapFormats, [Display.ptr, :pointer], :pointer
    attach_function :XListDepths, [Display.ptr, :int, :pointer], :pointer
    attach_function :XReconfigureWMWindow, [Display.ptr, :Window, :int, :uint, :pointer], :Status
    attach_function :XGetWMProtocols, [Display.ptr, :Window, :pointer, :pointer], :Status
    attach_function :XSetWMProtocols, [Display.ptr, :Window, :pointer, :int], :Status
    attach_function :XIconifyWindow, [Display.ptr, :Window, :int], :Status
    attach_function :XWithdrawWindow, [Display.ptr, :Window, :int], :Status
    attach_function :XGetCommand, [Display.ptr, :Window, :pointer, :pointer], :Status
    attach_function :XGetWMColormapWindows, [Display.ptr, :Window, :pointer, :pointer], :Status
    attach_function :XSetWMColormapWindows, [Display.ptr, :Window, :pointer, :int], :Status
    attach_function :XFreeStringList, [:pointer], :void
    attach_function :XSetTransientForHint, [Display.ptr, :Window, :Window], :int
    attach_function :XActivateScreenSaver, [Display.ptr], :int
    attach_function :XAddHost, [Display.ptr, :pointer], :int
    attach_function :XAddHosts, [Display.ptr, :pointer, :int], :int
    attach_function :XAddToExtensionList, [:pointer, :pointer], :int
    attach_function :XAddToSaveSet, [Display.ptr, :Window], :int
    attach_function :XAllocColor, [Display.ptr, :Colormap, :pointer], :Status
    attach_function :XAllocColorCells, [Display.ptr, :Colormap, :bool, :pointer, :uint, :pointer, :uint], :Status
    attach_function :XAllocColorPlanes, [Display.ptr, :Colormap, :bool, :pointer, :int, :int, :int, :int, :pointer, :pointer, :pointer], :Status
    attach_function :XAllocNamedColor, [Display.ptr, :Colormap, :string, :pointer, :pointer], :Status
    attach_function :XAllowEvents, [Display.ptr, :int, :Time], :int
    attach_function :XAutoRepeatOff, [Display.ptr], :int
    attach_function :XAutoRepeatOn, [Display.ptr], :int
    attach_function :XBell, [Display.ptr, :int], :int
    attach_function :XBitmapBitOrder, [Display.ptr], :int
    attach_function :XBitmapPad, [Display.ptr], :int
    attach_function :XBitmapUnit, [Display.ptr], :int
    attach_function :XCellsOfScreen, [:pointer], :int
    attach_function :XChangeActivePointerGrab, [Display.ptr, :uint, :Cursor, :Time], :int
    attach_function :XChangeGC, [Display.ptr, :GC, :ulong, :pointer], :int
    attach_function :XChangeKeyboardControl, [Display.ptr, :ulong, :pointer], :int
    attach_function :XChangeKeyboardMapping, [Display.ptr, :int, :int, :pointer, :int], :int
    attach_function :XChangePointerControl, [Display.ptr, :bool, :bool, :int, :int, :int], :int
    attach_function :XChangeProperty, [Display.ptr, :Window, :Atom, :Atom, :int, :int, :pointer, :int], :int
    attach_function :XChangeSaveSet, [Display.ptr, :Window, :int], :int
    attach_function :XChangeWindowAttributes, [Display.ptr, :Window, :ulong, :pointer], :int
    attach_function :XCheckMaskEvent, [Display.ptr, :long, XEvent.ptr], :bool
    attach_function :XCheckTypedEvent, [Display.ptr, :int, XEvent.ptr], :bool
    attach_function :XCheckTypedWindowEvent, [Display.ptr, :Window, :int, XEvent.ptr], :bool
    attach_function :XCheckWindowEvent, [Display.ptr, :Window, :long, XEvent.ptr], :bool
    attach_function :XCirculateSubwindows, [Display.ptr, :Window, :int], :int
    attach_function :XCirculateSubwindowsDown, [Display.ptr, :Window], :int
    attach_function :XCirculateSubwindowsUp, [Display.ptr, :Window], :int
    attach_function :XClearArea, [Display.ptr, :Window, :int, :int, :uint, :uint, :bool], :int
    attach_function :XClearWindow, [Display.ptr, :Window], :int
    attach_function :XCloseDisplay, [Display.ptr], :int
    attach_function :XConfigureWindow, [Display.ptr, :Window, :uint, :pointer], :int
    attach_function :XConnectionNumber, [Display.ptr], :int
    attach_function :XConvertSelection, [Display.ptr, :Atom, :Atom, :Atom, :Window, :Time], :int
    attach_function :XCopyArea, [Display.ptr, :Drawable, :Drawable, :GC, :int, :int, :uint, :uint, :int, :int], :int
    attach_function :XCopyGC, [Display.ptr, :GC, :ulong, :GC], :int
    attach_function :XCopyPlane, [Display.ptr, :Drawable, :Drawable, :GC, :int, :int, :uint, :uint, :int, :int, :ulong], :int
    attach_function :XDefaultDepth, [Display.ptr, :int], :int
    attach_function :XDefaultDepthOfScreen, [:pointer], :int
    attach_function :XDefaultScreen, [Display.ptr], :int
    attach_function :XDefineCursor, [Display.ptr, :Window, :Cursor], :int
    attach_function :XDeleteProperty, [Display.ptr, :Window, :Atom], :int
    attach_function :XDestroyWindow, [Display.ptr, :Window], :int
    attach_function :XDestroySubwindows, [Display.ptr, :Window], :int
    attach_function :XDoesBackingStore, [:pointer], :int
    attach_function :XDoesSaveUnders, [:pointer], :bool
    attach_function :XDisableAccessControl, [Display.ptr], :int
    attach_function :XDisplayCells, [Display.ptr, :int], :int
    attach_function :XDisplayHeight, [Display.ptr, :int], :int
    attach_function :XDisplayHeightMM, [Display.ptr, :int], :int
    attach_function :XDisplayKeycodes, [Display.ptr, :pointer, :pointer], :int
    attach_function :XDisplayPlanes, [Display.ptr, :int], :int
    attach_function :XDisplayWidth, [Display.ptr, :int], :int
    attach_function :XDisplayWidthMM, [Display.ptr, :int], :int
    attach_function :XDrawArc, [Display.ptr, :Drawable, :GC, :int, :int, :uint, :uint, :int, :int], :int
    attach_function :XDrawArcs, [Display.ptr, :Drawable, :GC, :pointer, :int], :int
    attach_function :XDrawImageString, [Display.ptr, :Drawable, :GC, :int, :int, :string, :int], :int
    attach_function :XDrawImageString16, [Display.ptr, :Drawable, :GC, :int, :int, :pointer, :int], :int
    attach_function :XDrawLine, [Display.ptr, :Drawable, :GC, :int, :int, :int, :int], :int
    attach_function :XDrawLines, [Display.ptr, :Drawable, :GC, :pointer, :int, :int], :int
    attach_function :XDrawPoint, [Display.ptr, :Drawable, :GC, :int, :int], :int
    attach_function :XDrawPoints, [Display.ptr, :Drawable, :GC, :pointer, :int, :int], :int
    attach_function :XDrawRectangle, [Display.ptr, :Drawable, :GC, :int, :int, :uint, :uint], :int
    attach_function :XDrawRectangles, [Display.ptr, :Drawable, :GC, :pointer, :int], :int
    attach_function :XDrawSegments, [Display.ptr, :Drawable, :GC, :pointer, :int], :int
    attach_function :XDrawString, [Display.ptr, :Drawable, :GC, :int, :int, :string, :int], :int
    attach_function :XDrawString16, [Display.ptr, :Drawable, :GC, :int, :int, :pointer, :int], :int
    attach_function :XDrawText, [Display.ptr, :Drawable, :GC, :int, :int, :pointer, :int], :int
    attach_function :XDrawText16, [Display.ptr, :Drawable, :GC, :int, :int, :pointer, :int], :int
    attach_function :XEnableAccessControl, [Display.ptr], :int
    attach_function :XEventsQueued, [Display.ptr, :int], :int
    attach_function :XFetchName, [Display.ptr, :Window, :pointer], :Status
    attach_function :XFillArc, [Display.ptr, :Drawable, :GC, :int, :int, :uint, :uint, :int, :int], :int
    attach_function :XFillArcs, [Display.ptr, :Drawable, :GC, :pointer, :int], :int
    attach_function :XFillPolygon, [Display.ptr, :Drawable, :GC, :pointer, :int, :int, :int], :int
    attach_function :XFillRectangle, [Display.ptr, :Drawable, :GC, :int, :int, :uint, :uint], :int
    attach_function :XFillRectangles, [Display.ptr, :Drawable, :GC, :pointer, :int], :int
    attach_function :XFlush, [Display.ptr], :int
    attach_function :XForceScreenSaver, [Display.ptr, :int], :int
    attach_function :XFree, [:pointer], :int
    attach_function :XFreeColormap, [Display.ptr, :Colormap], :int
    attach_function :XFreeColors, [Display.ptr, :Colormap, :pointer, :int, :ulong], :int
    attach_function :XFreeCursor, [Display.ptr, :Cursor], :int
    attach_function :XFreeExtensionList, [:pointer], :int
    attach_function :XFreeFont, [Display.ptr, :pointer], :int
    attach_function :XFreeFontInfo, [:pointer, :pointer, :int], :int
    attach_function :XFreeFontNames, [:pointer], :int
    attach_function :XFreeFontPath, [:pointer], :int
    attach_function :XFreeGC, [Display.ptr, :GC], :int
    attach_function :XFreeModifiermap, [:pointer], :int
    attach_function :XFreePixmap, [Display.ptr, :Pixmap], :int
    attach_function :XGeometry, [Display.ptr, :int, :string, :string, :uint, :uint, :uint, :int, :int, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XGetErrorDatabaseText, [Display.ptr, :string, :string, :string, :string, :int], :int
    attach_function :XGetErrorText, [Display.ptr, :int, :string, :int], :int
    attach_function :XGetFontProperty, [:pointer, :Atom, :pointer], :bool
    attach_function :XGetGCValues, [Display.ptr, :GC, :ulong, :pointer], :Status
    attach_function :XGetGeometry, [Display.ptr, :Drawable, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :Status
    attach_function :XGetIconName, [Display.ptr, :Window, :pointer], :Status
    attach_function :XGetInputFocus, [Display.ptr, :pointer, :pointer], :int
    attach_function :XGetKeyboardControl, [Display.ptr, :pointer], :int
    attach_function :XGetPointerControl, [Display.ptr, :pointer, :pointer, :pointer], :int
    attach_function :XGetPointerMapping, [Display.ptr, :pointer, :int], :int
    attach_function :XGetScreenSaver, [Display.ptr, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XGetTransientForHint, [Display.ptr, :Window, :pointer], :Status
    attach_function :XGetWindowProperty, [Display.ptr, :Window, :Atom, :long, :long, :bool, :Atom, :pointer, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XGetWindowAttributes, [Display.ptr, :Window, :pointer], :Status
    attach_function :XGrabButton, [Display.ptr, :uint, :uint, :Window, :bool, :uint, :int, :int, :Window, :Cursor], :int
    attach_function :XGrabKey, [Display.ptr, :int, :uint, :Window, :bool, :int, :int], :int
    attach_function :XGrabKeyboard, [Display.ptr, :Window, :bool, :int, :int, :Time], :int
    attach_function :XGrabPointer, [Display.ptr, :Window, :bool, :uint, :int, :int, :Window, :Cursor, :Time], :int
    attach_function :XGrabServer, [Display.ptr], :int
    attach_function :XHeightMMOfScreen, [:pointer], :int
    attach_function :XHeightOfScreen, [:pointer], :int
    attach_function :XImageByteOrder, [Display.ptr], :int
    attach_function :XInstallColormap, [Display.ptr, :Colormap], :int
    attach_function :XKeysymToKeycode, [Display.ptr, :KeySym], :KeyCode
    attach_function :XKillClient, [Display.ptr, :XID], :int
    attach_function :XLookupColor, [Display.ptr, :Colormap, :string, :pointer, :pointer], :Status
    attach_function :XLowerWindow, [Display.ptr, :Window], :int
    attach_function :XMapRaised, [Display.ptr, :Window], :int
    attach_function :XMapSubwindows, [Display.ptr, :Window], :int
    attach_function :XMapWindow, [Display.ptr, :Window], :int
    attach_function :XMaskEvent, [Display.ptr, :long, XEvent.ptr], :int
    attach_function :XMaxCmapsOfScreen, [:pointer], :int
    attach_function :XMinCmapsOfScreen, [:pointer], :int
    attach_function :XMoveResizeWindow, [Display.ptr, :Window, :int, :int, :uint, :uint], :int
    attach_function :XMoveWindow, [Display.ptr, :Window, :int, :int], :int
    attach_function :XNextEvent, [Display.ptr, XEvent.ptr], :int, blocking: true
    attach_function :XNoOp, [Display.ptr], :int
    attach_function :XParseColor, [Display.ptr, :Colormap, :string, :pointer], :Status
    attach_function :XParseGeometry, [:string, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XPeekEvent, [Display.ptr, XEvent.ptr], :int
    attach_function :XPending, [Display.ptr], :int
    attach_function :XPlanesOfScreen, [:pointer], :int
    attach_function :XProtocolRevision, [Display.ptr], :int
    attach_function :XProtocolVersion, [Display.ptr], :int
    attach_function :XPutBackEvent, [Display.ptr, XEvent.ptr], :int
    attach_function :XPutImage, [Display.ptr, :Drawable, :GC, :pointer, :int, :int, :int, :int, :uint, :uint], :int
    attach_function :XQLength, [Display.ptr], :int
    attach_function :XQueryBestCursor, [Display.ptr, :Drawable, :uint, :uint, :pointer, :pointer], :Status
    attach_function :XQueryBestSize, [Display.ptr, :int, :Drawable, :uint, :uint, :pointer, :pointer], :Status
    attach_function :XQueryBestStipple, [Display.ptr, :Drawable, :uint, :uint, :pointer, :pointer], :Status
    attach_function :XQueryBestTile, [Display.ptr, :Drawable, :uint, :uint, :pointer, :pointer], :Status
    attach_function :XQueryColor, [Display.ptr, :Colormap, :pointer], :int
    attach_function :XQueryColors, [Display.ptr, :Colormap, :pointer, :int], :int
    attach_function :XQueryExtension, [Display.ptr, :string, :pointer, :pointer, :pointer], :bool
    attach_function :XQueryKeymap, [Display.ptr, :pointer], :int
    attach_function :XQueryPointer, [Display.ptr, :Window, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :XQueryTextExtents, [Display.ptr, :XID, :string, :int, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XQueryTextExtents16, [Display.ptr, :XID, :pointer, :int, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XQueryTree, [Display.ptr, :Window, :pointer, :pointer, :pointer, :pointer], :Status
    attach_function :XRaiseWindow, [Display.ptr, :Window], :int
    attach_function :XReadBitmapFile, [Display.ptr, :Drawable, :string, :pointer, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XReadBitmapFileData, [:string, :pointer, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XRebindKeysym, [Display.ptr, :KeySym, :pointer, :int, :pointer, :int], :int
    attach_function :XRecolorCursor, [Display.ptr, :Cursor, :pointer, :pointer], :int
    attach_function :XRefreshKeyboardMapping, [XMappingEvent.ptr], :int
    attach_function :XRemoveFromSaveSet, [Display.ptr, :Window], :int
    attach_function :XRemoveHost, [Display.ptr, :pointer], :int
    attach_function :XRemoveHosts, [Display.ptr, :pointer, :int], :int
    attach_function :XReparentWindow, [Display.ptr, :Window, :Window, :int, :int], :int
    attach_function :XResetScreenSaver, [Display.ptr], :int
    attach_function :XResizeWindow, [Display.ptr, :Window, :uint, :uint], :int
    attach_function :XRestackWindows, [Display.ptr, :pointer, :int], :int
    attach_function :XRotateBuffers, [Display.ptr, :int], :int
    attach_function :XRotateWindowProperties, [Display.ptr, :Window, :pointer, :int, :int], :int
    attach_function :XScreenCount, [Display.ptr], :int
    attach_function :XSelectInput, [Display.ptr, :Window, :long], :int
    attach_function :XSendEvent, [Display.ptr, :Window, :bool, :long, XEvent.ptr], :Status
    attach_function :XSetAccessControl, [Display.ptr, :int], :int
    attach_function :XSetArcMode, [Display.ptr, :GC, :int], :int
    attach_function :XSetBackground, [Display.ptr, :GC, :ulong], :int
    attach_function :XSetClipMask, [Display.ptr, :GC, :Pixmap], :int
    attach_function :XSetClipOrigin, [Display.ptr, :GC, :int, :int], :int
    attach_function :XSetClipRectangles, [Display.ptr, :GC, :int, :int, :pointer, :int, :int], :int
    attach_function :XSetCloseDownMode, [Display.ptr, :int], :int
    attach_function :XSetCommand, [Display.ptr, :Window, :pointer, :int], :int
    attach_function :XSetDashes, [Display.ptr, :GC, :int, :string, :int], :int
    attach_function :XSetFillRule, [Display.ptr, :GC, :int], :int
    attach_function :XSetFillStyle, [Display.ptr, :GC, :int], :int
    attach_function :XSetFont, [Display.ptr, :GC, :Font], :int
    attach_function :XSetFontPath, [Display.ptr, :pointer, :int], :int
    attach_function :XSetForeground, [Display.ptr, :GC, :ulong], :int
    attach_function :XSetFunction, [Display.ptr, :GC, :int], :int
    attach_function :XSetGraphicsExposures, [Display.ptr, :GC, :bool], :int
    attach_function :XSetIconName, [Display.ptr, :Window, :string], :int
    attach_function :XSetInputFocus, [Display.ptr, :Window, :int, :Time], :int
    attach_function :XSetLineAttributes, [Display.ptr, :GC, :uint, :int, :int, :int], :int
    attach_function :XSetModifierMapping, [Display.ptr, :pointer], :int
    attach_function :XSetPlaneMask, [Display.ptr, :GC, :ulong], :int
    attach_function :XSetPointerMapping, [Display.ptr, :pointer, :int], :int
    attach_function :XSetScreenSaver, [Display.ptr, :int, :int, :int, :int], :int
    attach_function :XSetSelectionOwner, [Display.ptr, :Atom, :Window, :Time], :int
    attach_function :XSetState, [Display.ptr, :GC, :ulong, :ulong, :int, :ulong], :int
    attach_function :XSetStipple, [Display.ptr, :GC, :Pixmap], :int
    attach_function :XSetSubwindowMode, [Display.ptr, :GC, :int], :int
    attach_function :XSetTSOrigin, [Display.ptr, :GC, :int, :int], :int
    attach_function :XSetTile, [Display.ptr, :GC, :Pixmap], :int
    attach_function :XSetWindowBackground, [Display.ptr, :Window, :ulong], :int
    attach_function :XSetWindowBackgroundPixmap, [Display.ptr, :Window, :Pixmap], :int
    attach_function :XSetWindowBorder, [Display.ptr, :Window, :ulong], :int
    attach_function :XSetWindowBorderPixmap, [Display.ptr, :Window, :Pixmap], :int
    attach_function :XSetWindowBorderWidth, [Display.ptr, :Window, :uint], :int
    attach_function :XSetWindowColormap, [Display.ptr, :Window, :Colormap], :int
    attach_function :XStoreBuffer, [Display.ptr, :string, :int, :int], :int
    attach_function :XStoreBytes, [Display.ptr, :string, :int], :int
    attach_function :XStoreColor, [Display.ptr, :Colormap, :pointer], :int
    attach_function :XStoreColors, [Display.ptr, :Colormap, :pointer, :int], :int
    attach_function :XStoreName, [Display.ptr, :Window, :string], :int
    attach_function :XStoreNamedColor, [Display.ptr, :Colormap, :string, :ulong, :int], :int
    attach_function :XSync, [Display.ptr, :bool], :int, blocking: true
    attach_function :XTextExtents, [:pointer, :string, :int, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XTextExtents16, [:pointer, :pointer, :int, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :XTextWidth, [:pointer, :string, :int], :int
    attach_function :XTextWidth16, [:pointer, :pointer, :int], :int
    attach_function :XTranslateCoordinates, [Display.ptr, :Window, :Window, :int, :int, :pointer, :pointer, :pointer], :bool
    attach_function :XUndefineCursor, [Display.ptr, :Window], :int
    attach_function :XUngrabButton, [Display.ptr, :uint, :uint, :Window], :int
    attach_function :XUngrabKey, [Display.ptr, :int, :uint, :Window], :int
    attach_function :XUngrabKeyboard, [Display.ptr, :Time], :int
    attach_function :XUngrabPointer, [Display.ptr, :Time], :int
    attach_function :XUngrabServer, [Display.ptr], :int
    attach_function :XUninstallColormap, [Display.ptr, :Colormap], :int
    attach_function :XUnloadFont, [Display.ptr, :Font], :int
    attach_function :XUnmapSubwindows, [Display.ptr, :Window], :int
    attach_function :XUnmapWindow, [Display.ptr, :Window], :int
    attach_function :XVendorRelease, [Display.ptr], :int
    attach_function :XWarpPointer, [Display.ptr, :Window, :Window, :int, :int, :uint, :uint, :int, :int], :int
    attach_function :XWidthMMOfScreen, [:pointer], :int
    attach_function :XWidthOfScreen, [:pointer], :int
    attach_function :XWindowEvent, [Display.ptr, :Window, :long, XEvent.ptr], :int
    attach_function :XWriteBitmapFile, [Display.ptr, :string, :Pixmap, :uint, :uint, :int, :int], :int
    attach_function :XSupportsLocale, [], :bool
    attach_function :XSetLocaleModifiers, [:string], :string
    attach_function :XOpenOM, [Display.ptr, :pointer, :string, :string], :pointer
    attach_function :XCloseOM, [:pointer], :Status
    attach_function :XDisplayOfOM, [:pointer], Display.ptr
    attach_function :XLocaleOfOM, [:pointer], :string
    attach_function :XDestroyOC, [:pointer], :void
    attach_function :XOMOfOC, [:pointer], :pointer
    attach_function :XCreateFontSet, [Display.ptr, :string, :pointer, :pointer, :pointer], :pointer
    attach_function :XFreeFontSet, [Display.ptr, :pointer], :void
    attach_function :XFontsOfFontSet, [:pointer, :pointer, :pointer], :int
    attach_function :XBaseFontNameListOfFontSet, [:pointer], :string
    attach_function :XLocaleOfFontSet, [:pointer], :string
    attach_function :XContextDependentDrawing, [:pointer], :bool
    attach_function :XDirectionalDependentDrawing, [:pointer], :bool
    attach_function :XContextualDrawing, [:pointer], :bool
    attach_function :XExtentsOfFontSet, [:pointer], :pointer
    attach_function :XmbTextEscapement, [:pointer, :string, :int], :int
    attach_function :XwcTextEscapement, [:pointer, :pointer, :int], :int
    attach_function :Xutf8TextEscapement, [:pointer, :string, :int], :int
    attach_function :XmbTextExtents, [:pointer, :string, :int, :pointer, :pointer], :int
    attach_function :XwcTextExtents, [:pointer, :pointer, :int, :pointer, :pointer], :int
    attach_function :Xutf8TextExtents, [:pointer, :string, :int, :pointer, :pointer], :int
    attach_function :XmbTextPerCharExtents, [:pointer, :string, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], :Status
    attach_function :XwcTextPerCharExtents, [:pointer, :pointer, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], :Status
    attach_function :Xutf8TextPerCharExtents, [:pointer, :string, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], :Status
    attach_function :XmbDrawText, [Display.ptr, :Drawable, :GC, :int, :int, :pointer, :int], :void
    attach_function :XwcDrawText, [Display.ptr, :Drawable, :GC, :int, :int, :pointer, :int], :void
    attach_function :Xutf8DrawText, [Display.ptr, :Drawable, :GC, :int, :int, :pointer, :int], :void
    attach_function :XmbDrawString, [Display.ptr, :Drawable, :pointer, :GC, :int, :int, :string, :int], :void
    attach_function :XwcDrawString, [Display.ptr, :Drawable, :pointer, :GC, :int, :int, :pointer, :int], :void
    attach_function :Xutf8DrawString, [Display.ptr, :Drawable, :pointer, :GC, :int, :int, :string, :int], :void
    attach_function :XmbDrawImageString, [Display.ptr, :Drawable, :pointer, :GC, :int, :int, :string, :int], :void
    attach_function :XwcDrawImageString, [Display.ptr, :Drawable, :pointer, :GC, :int, :int, :pointer, :int], :void
    attach_function :Xutf8DrawImageString, [Display.ptr, :Drawable, :pointer, :GC, :int, :int, :string, :int], :void
    attach_function :XOpenIM, [Display.ptr, :pointer, :string, :string], :pointer
    attach_function :XCloseIM, [:pointer], :Status
    attach_function :XDisplayOfIM, [:pointer], Display.ptr
    attach_function :XLocaleOfIM, [:pointer], :string
    attach_function :XDestroyIC, [:pointer], :void
    attach_function :XSetICFocus, [:pointer], :void
    attach_function :XUnsetICFocus, [:pointer], :void
    attach_function :XwcResetIC, [:pointer], :pointer
    attach_function :XmbResetIC, [:pointer], :string
    attach_function :Xutf8ResetIC, [:pointer], :string
    attach_function :XIMOfIC, [:pointer], :pointer
    attach_function :XFilterEvent, [XEvent.ptr, :Window], :bool
    attach_function :XmbLookupString, [:pointer, :pointer, :string, :int, :pointer, :pointer], :int
    attach_function :XwcLookupString, [:pointer, :pointer, :pointer, :int, :pointer, :pointer], :int
    attach_function :Xutf8LookupString, [:pointer, :pointer, :string, :int, :pointer, :pointer], :int
    attach_function :XRegisterIMInstantiateCallback, [Display.ptr, :pointer, :string, :string, :XIDProc, :XPointer], :bool
    attach_function :XUnregisterIMInstantiateCallback, [Display.ptr, :pointer, :string, :string, :XIDProc, :XPointer], :bool
    attach_function :XInternalConnectionNumbers, [Display.ptr, :pointer, :pointer], :Status
    attach_function :XProcessInternalConnection, [Display.ptr, :int], :void
    attach_function :XAddConnectionWatch, [Display.ptr, :XConnectionWatchProc, :XPointer], :Status
    attach_function :XRemoveConnectionWatch, [Display.ptr, :XConnectionWatchProc, :XPointer], :void
    attach_function :XSetAuthorization, [:string, :int, :string, :int], :void
    attach_function :_Xmbtowc, [:pointer, :string, :int], :int
    attach_function :_Xwctomb, [:string, :pointer], :int
    attach_function :XGetEventData, [Display.ptr, XGenericEventCookie.ptr], :bool
    attach_function :XFreeEventData, [Display.ptr, XGenericEventCookie.ptr], :void
  end
end
