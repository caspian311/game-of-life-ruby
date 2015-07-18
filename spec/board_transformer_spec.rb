
require 'board.rb'
require 'board_transformer.rb'

describe :BoardTransformer do
   describe '#update' do
      it 'should transform the board correctly' do
         board = Board.new 3
         board.revive 0, 1
         board.revive 1, 1
         board.revive 2, 1

         transformed_board = BoardTransformer.new.update board

         expected_board = Board.new 3
         expected_board.revive 1, 0
         expected_board.revive 1, 1
         expected_board.revive 1, 2

         expect(expected_board).to eq(transformed_board)
      end

      it 'should leave a static 4 square block alone' do
         board = Board.new 4
         board.revive 1, 1
         board.revive 1, 2
         board.revive 2, 1
         board.revive 2, 2

         transformed_board = BoardTransformer.new.update board

         expected_board = Board.new 4
         expected_board.revive 1, 1
         expected_board.revive 1, 2
         expected_board.revive 2, 1
         expected_board.revive 2, 2

         expect(expected_board).to eq(transformed_board)
      end
   end
end
