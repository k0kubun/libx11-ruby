require 'libx11'

class XServer
  def self.with_connection
    display = LibX11::Xlib.XOpenDisplay(nil)
    yield(display)
  ensure
    LibX11::Xlib.XCloseDisplay(display) if display
  end

  def self.bind_events(display, window, event_mask)
    wm_detected = false
    LibX11::Xlib.XSetErrorHandler -> (display, error) do
      if error[:error_code] == LibX11::X::BadAccess
        wm_detected = true
      end
      0
    end

    LibX11::Xlib.XSelectInput(display, window, event_mask)
    LibX11::Xlib.XSync(display, 0)

    if wm_detected
      abort 'Another window manager detected!'
    end
  end
end

XServer.with_connection do |display|
  if display.nil?
    abort 'Failed to connect to X server.'
  end

  XServer.bind_events(
    display, LibX11::Xlib.XDefaultRootWindow(display),
    LibX11::X::KeyPressMask |
    LibX11::X::SubstructureRedirectMask |
    LibX11::X::SubstructureNotifyMask,
  )

  LibX11::Xlib.XSetErrorHandler -> (display, error) do
    $stderr.puts "Error detected: (error_code=#{error[:error_code]})"
    0
  end

  loop do
    event = LibX11::Xlib::XEvent.new
    LibX11::Xlib.XNextEvent(display, event)

    case event[:type]
    when LibX11::X::CreateNotify
      # hook creation
    when LibX11::X::DestroyNotify
      # hook destruction
    when LibX11::X::ReparentNotify
      # hook reparenting
    when LibX11::X::KeyPress
      break
    end
  end
end
