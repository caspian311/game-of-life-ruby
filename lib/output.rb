require 'curses'

class Output
   def initialize
      Curses.init_screen
   end

   def print(s)
      Curses.setpos(0, 0)
      Curses.addstr(s)
      Curses.refresh
      sleep 1.0/8.0
   end

   def done
      Curses.close_screen
   end
end
