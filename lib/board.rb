
class Board
   attr_reader :size

   def initialize(size)
      @size = size
      @grid = []
   end

   def is_alive?(x, y)
      return @grid.any? {|cell| cell.x == x && cell.y == y}
   end

   def kill(x, y)
      @grid = @grid.reject {|cell| cell.x == x && cell.y == y}
   end

   def revive(x, y)
      @grid << Cell.new(x, y)
   end

   def size
      @size
   end

   def ==(other)
      @size == other.size && live_cells_match(other.live_cells)
   end

   def to_s
      "board of size #{@size} with cells: #{live_cells.join ', '}"
   end

   protected
   def live_cells_match(other_cells)
      live_cells.length == other_cells.length && live_cells.all? do |cell|
         other_cells.any? do |other_cell|
            cell.x == other_cell.x && cell.y == other_cell.y
         end
      end
   end

   def live_cells
      @grid
   end
end

class Cell
   attr_reader :x
   attr_reader :y

   def initialize(x, y)
      @x = x
      @y = y
   end

   def ==(other)
      self.x == other.x && self.y == other.y
   end

   def to_s
      "(#{x}, #{y})"
   end
end
