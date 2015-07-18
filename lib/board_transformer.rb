require_relative 'neighbor_counter.rb'

class BoardTransformer
   def update(previous_board)
      new_board = Board.new previous_board.size

      previous_board.size.times do |x|
         previous_board.size.times do |y|
            number_of_neighbors = NeighborCounter.new.count_neighbors previous_board, x, y
            if previous_board.is_alive? x, y
               if number_of_neighbors == 2 || number_of_neighbors == 3
                  new_board.revive x, y
               end
            else
               if number_of_neighbors == 3
                  new_board.revive x, y
               end
            end
         end
      end

      new_board
   end
end
