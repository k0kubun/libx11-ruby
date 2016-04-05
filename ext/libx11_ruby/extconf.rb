require 'mkmf'

$CFLAGS << ' -Wall -Wextra'
abort 'Cannot find libx11' unless have_library('X11')

create_makefile('libx11/libx11_ruby')
