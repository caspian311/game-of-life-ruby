require_relative 'neighbor_counter.rb'

class BoardTransformer
   def update(previous_board)
      new_board = Board.new previous_board.size

      previous_board.size.times do |x|
         previous_board.size.times do |y|
            if should_revive? previous_board, x, y
               new_board.revive x, y
            end
         end
      end

      new_board
   end

   private
   def should_revive?(previous_board, x, y)
      number_of_neighbors = NeighborCounter.new.count_neighbors previous_board, x, y
      if number_of_neighbors == 3
         return true
      end

      previous_board.is_alive? x, y and number_of_neighbors == 2
   end
end
