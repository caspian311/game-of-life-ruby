
class NeighborCounter
   def count_neighbors(board, x, y)
      count = 0

      count += 1 if board.is_alive? x-1, y-1
      count += 1 if board.is_alive? x, y-1
      count += 1 if board.is_alive? x+1, y-1
      count += 1 if board.is_alive? x-1, y
      count += 1 if board.is_alive? x+1, y
      count += 1 if board.is_alive? x-1, y+1
      count += 1 if board.is_alive? x, y+1
      count += 1 if board.is_alive? x+1, y+1

      count
   end
end
