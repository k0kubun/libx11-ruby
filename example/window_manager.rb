require 'libx11'

class XServer
  def self.with_connection
    display = LibX11.xopen_display
    yield(display)
  ensure
    LibX11.xclose_display(display) if display
  end

  def self.bind_events(display, window, event_mask)
    wm_detected = false
    LibX11.xset_error_handler do |display, error|
      if error.error_code == LibX11::XErrorEvent::BAD_ACCESS
        wm_detected = true
      end
    end

    display.xselect_input(window, event_mask)
    display.xsync(false)

    if wm_detected
      abort "Another window manager detected!\n#{display.xdisplay_string}"
    end
  end
end

XServer.with_connection do |display|
  XServer.bind_events(
    display, display.default_root_window,
    LibX11::XEvent::KEY_PRESS_MASK |
    LibX11::XEvent::SUBSTRUCTURE_REDIRECT_MASK |
    LibX11::XEvent::SUBSTRUCTURE_NOTIFY_MASK,
  )

  LibX11.xset_error_handler do |display, error|
    $stderr.puts "Error detected: (error_code=#{error.error_code})"
  end

  loop do
    event = LibX11.xnext_event(display)
    case event.type
    when LibX11::XEvent::CREATE_NOTIFY
      # hook creation
    when LibX11::XEvent::DESTROY_NOTIFY
      # hook destruction
    when LibX11::XEvent::REPARENT_NOTIFY
      # hook reparenting
    when LibX11::XEvent::KEY_PRESS
      break
    end
  end
end
