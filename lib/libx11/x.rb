module LibX11
  module X
    #***************************************************************
    # EVENT DEFINITIONS
    #***************************************************************

    # Input Event Masks. Used as event-mask window attribute and as arguments
    # to Grab requests.  Not to be confused with event names.

    NoEventMask              = 0
    KeyPressMask             = (1<<0)
    KeyReleaseMask           = (1<<1)
    ButtonPressMask          = (1<<2)
    ButtonReleaseMask        = (1<<3)
    EnterWindowMask          = (1<<4)
    LeaveWindowMask          = (1<<5)
    PointerMotionMask        = (1<<6)
    PointerMotionHintMask    = (1<<7)
    Button1MotionMask        = (1<<8)
    Button2MotionMask        = (1<<9)
    Button3MotionMask        = (1<<10)
    Button4MotionMask        = (1<<11)
    Button5MotionMask        = (1<<12)
    ButtonMotionMask         = (1<<13)
    KeymapStateMask          = (1<<14)
    ExposureMask             = (1<<15)
    VisibilityChangeMask     = (1<<16)
    StructureNotifyMask      = (1<<17)
    ResizeRedirectMask       = (1<<18)
    SubstructureNotifyMask   = (1<<19)
    SubstructureRedirectMask = (1<<20)
    FocusChangeMask          = (1<<21)
    PropertyChangeMask       = (1<<22)
    ColormapChangeMask       = (1<<23)
    OwnerGrabButtonMask      = (1<<24)

    # Event names.  Used in "type" field in XEvent structures.  Not to be
    # confused with event masks above.  They start from 2 because 0 and 1
    # are reserved in the protocol for errors and replies.

    KeyPress         = 2
    KeyRelease       = 3
    ButtonPress      = 4
    ButtonRelease    = 5
    MotionNotify     = 6
    EnterNotify      = 7
    LeaveNotify      = 8
    FocusIn          = 9
    FocusOut         = 10
    KeymapNotify     = 11
    Expose           = 12
    GraphicsExpose   = 13
    NoExpose         = 14
    VisibilityNotify = 15
    CreateNotify     = 16
    DestroyNotify    = 17
    UnmapNotify      = 18
    MapNotify        = 19
    MapRequest       = 20
    ReparentNotify   = 21
    ConfigureNotify  = 22

    #****************************************************************
    # ERROR CODES
    #****************************************************************

    Success           = 0
    BadRequest        = 1
    BadValue          = 2
    BadWindow         = 3
    BadPixmap         = 4
    BadAtom           = 5
    BadCursor         = 6
    BadFont           = 7
    BadMatch          = 8
    BadDrawable       = 9
    BadAccess         = 10
    BadAlloc          = 11
    BadColor          = 12
    BadGC             = 13
    BadIDChoice       = 14
    BadName           = 15
    BadLength         = 16
    BadImplementation = 17

    FirstExtensionError = 128
    LastExtensionError  = 255
  end
end
