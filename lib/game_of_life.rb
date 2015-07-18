require_relative 'board.rb'
require_relative 'board_transformer.rb'
require_relative 'console.rb'

class GameOfLife
   def initialize(output, initial_board)
      @console = Console.new(output)
      @initial_board = initial_board
   end

   def play(iterations)
      board = @initial_board
      @console.show board
      (iterations - 1).times do 
         board = BoardTransformer.new.update board
         @console.show board
      end
   end
end
