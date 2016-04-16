module LibX11
  module X
    #****************************************************************
    # RESERVED RESOURCE AND CONSTANT DEFINITIONS
    #****************************************************************

    None            = 0 # universal null resource or null atom
    ParentRelative  = 1 # background pixmap in CreateWindow and ChangeWindowAttributes
    CopyFromParent  = 0 # border pixmap in CreateWindow and ChangeWindowAttributes special
                        # VisualID and special window class passed to CreateWindow
    PointerWindow   = 0 # destination window in SendEvent
    InputFocus      = 1 # destination window in SendEvent
    PointerRoot     = 1 # focus window in SetInputFocus
    AnyPropertyType = 0 # special Atom, passed to GetProperty
    AnyKey          = 0 # special Key Code, passed to GrabKey
    AnyButton       = 0 # special Button Code, passed to GrabButton
    AllTemporary    = 0 # special Resource ID passed to KillClient
    CurrentTime     = 0 # special Time
    NoSymbol        = 0 # special KeySym

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
    ConfigureRequest = 23
    GravityNotify    = 24
    ResizeRequest    = 25
    CirculateNotify  = 26
    CirculateRequest = 27
    PropertyNotify   = 28
    SelectionClear   = 29
    SelectionRequest = 30
    SelectionNotify  = 31
    ColormapNotify   = 32
    ClientMessage    = 33
    MappingNotify    = 34
    GenericEvent     = 35
    LASTEvent        = 36

    # Key masks. Used as modifiers to GrabButton and GrabKey, results of QueryPointer,
    # state in various key-, mouse-, and button-related events.

    ShiftMask   = (1<<0)
    LockMask    = (1<<1)
    ControlMask = (1<<2)
    Mod1Mask    = (1<<3)
    Mod2Mask    = (1<<4)
    Mod3Mask    = (1<<5)
    Mod4Mask    = (1<<6)
    Mod5Mask    = (1<<7)

    # button masks.  Used in same manner as Key masks above. Not to be confused
    # with button names below.

    Button1Mask = (1<<8)
    Button2Mask = (1<<9)
    Button3Mask = (1<<10)
    Button4Mask = (1<<11)
    Button5Mask = (1<<12)
    AnyModifier = (1<<15)

    # GrabPointer, GrabButton, GrabKeyboard, GrabKey Modes

    GrabModeSync  = 0
    GrabModeAsync = 1

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
