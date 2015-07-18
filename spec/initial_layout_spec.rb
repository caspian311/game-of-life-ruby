require 'initial_layout.rb'

describe :InitialLayout do
   describe '#board' do
      threeByThreeFile = File.join(File.dirname(__FILE__), '..', 'test_files', '3by3_example.txt')
      twoByTwoFile = File.join(File.dirname(__FILE__), '..', 'test_files', '2by2_example.txt')
      fiveByFiveFile = File.join(File.dirname(__FILE__), '..', 'test_files', '5by5_example.txt')

      it 'should represent the 2x2 example correctly' do
         initial_layout = InitialLayout.new(twoByTwoFile)

         board = initial_layout.board
         expect(board.size).to eq(2)
         expect(board.is_alive?(0, 0)).to eq(false)
         expect(board.is_alive?(0, 1)).to eq(true)
         expect(board.is_alive?(1, 0)).to eq(true)
         expect(board.is_alive?(1, 1)).to eq(false)
      end

      it 'should represent the 3x3 example correctly' do
         initial_layout = InitialLayout.new(threeByThreeFile)

         board = initial_layout.board
         expect(board.size).to eq(3)
         expect(board.is_alive?(0, 0)).to eq(true)
         expect(board.is_alive?(0, 1)).to eq(false)
         expect(board.is_alive?(0, 2)).to eq(false)
         expect(board.is_alive?(1, 0)).to eq(false)
         expect(board.is_alive?(1, 1)).to eq(true)
         expect(board.is_alive?(1, 2)).to eq(false)
         expect(board.is_alive?(2, 0)).to eq(false)
         expect(board.is_alive?(2, 1)).to eq(false)
         expect(board.is_alive?(2, 2)).to eq(true)
      end

      it 'should represent the 5x5 example correctly' do
         initial_layout = InitialLayout.new(fiveByFiveFile)

         board = initial_layout.board

         expect(board.size).to eq(5)

         (0..5).each do |x|
            (0..5).each do |y|
               expect(board.is_alive?(x, y)).to eq(false)
            end
         end
      end
   end
end
