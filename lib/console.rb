
class Console
   def initialize(output)
      @output = output
   end

   def show(board)
      message = ''
      board.size.times do |x|
         #message += '|'
         board.size.times do |y|
            message += board.is_alive?(x, y) ? '*' : ' '
         end
         message += "\n"
         #message += "|\n"
      end
      @output.print "#{message}\n"
   end

   def done
      @output.done
   end
end
