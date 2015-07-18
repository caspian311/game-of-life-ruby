require_relative 'board.rb'

class InitialLayout
   def initialize(file_path)
      read_file file_path
   end

   def board
      b = Board.new(@size)
      @starting_positions.each do |position|
         b.revive position[0], position[1]
      end
      b
   end

   private
   def read_file(file_path)
      @configuration = []
      File.open(file_path, 'r') do |file|
         @size = 0
         @starting_positions = []
         file.each_line do |line|
            line.split(//).each_with_index do |character, character_index|
               @starting_positions << [@size, character_index] if character == '*'
            end
            @size += 1
         end
      end
   end
end

