require 'libx11'
require_relative 'aliases'

WINDOW_POS_X  = 100
WINDOW_POS_Y  = 100
WINDOW_WIDTH  = 400
WINDOW_HEIGHT = 300
BORDER_WIDTH  = 2

display = Xlib.XOpenDisplay('')

root   = Xlib.XDefaultRootWindow(display)
screen = Xlib.XDefaultScreen(display)

white = Xlib.XWhitePixel(display, screen)
black = Xlib.XBlackPixel(display, screen)

window = Xlib.XCreateSimpleWindow(
  display, root,
  WINDOW_POS_X, WINDOW_POS_Y, WINDOW_WIDTH, WINDOW_HEIGHT,
  BORDER_WIDTH, black, white,
)

Xlib.XSelectInput(display, window, X::KeyPressMask)
Xlib.XMapWindow(display, window)

loop do
  event = Xlib::XEvent.new
  Xlib.XNextEvent(display, event)

  case event[:type]
  when X::KeyPress
    Xlib.XDestroyWindow(display, window)
    Xlib.XCloseDisplay(display)
    break
  end
end
