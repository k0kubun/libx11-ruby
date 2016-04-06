require 'spec_helper'

describe LibX11 do
  describe '.xopen_display' do
    it 'returns a display' do
      display = LibX11.xopen_display('')
      expect(display).to be_a(LibX11::Display)
      LibX11.xclose_display(display)
    end
  end

  describe '.xcreate_simple_window' do
    it 'returns a window' do
      display = LibX11.xopen_display('')
      window = LibX11.xcreate_simple_window(
        display, display.default_root_window,
        100, 100, 320, 280, 2, 0, 0,
      )
      expect(window).to be_a(Integer)
      LibX11.xdestroy_window(display, window)
      LibX11.xclose_display(display)
    end
  end
end
