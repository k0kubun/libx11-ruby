require 'spec_helper'

describe LibX11::Xlib do
  describe '.XOpenDisplay' do
    it 'returns a display' do
      display = LibX11::Xlib.XOpenDisplay('')
      expect(display).to be_a(LibX11::Xlib::Display)
      LibX11::Xlib.XCloseDisplay(display)
    end
  end

  describe '.XCreateSimpleWindow' do
    it 'returns a window' do
      display = LibX11::Xlib.XOpenDisplay('')
      window = LibX11::Xlib.XCreateSimpleWindow(
        display, LibX11::Xlib.XDefaultRootWindow(display),
        100, 100, 320, 280, 2, 0, 0,
      )
      expect(window).to be_a(Integer)
      LibX11::Xlib.XDestroyWindow(display, window)
      LibX11::Xlib.XCloseDisplay(display)
    end
  end
end
