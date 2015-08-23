require 'board.rb'

describe :Board do
   describe '#size' do
      it 'should give the size the board was initialized with' do
         expect(Board.new(5) .size).to eq(5)
         expect(Board.new(3) .size).to eq(3)
         expect(Board.new(12) .size).to eq(12)
      end
   end

   describe '#revive' do
      it 'should bring it to life' do
         board = Board.new(1)
         board.revive 0, 0

         expect(board.is_alive? 0, 0).to eq(true)
      end

      it 'should not die if trying to revive out of bounds cell' do
         board = Board.new(1)

         board.revive 1, 1
         board.revive 0, 1
      end
   end

   describe '#kill' do
      it 'should no longer be alive' do
         board = Board.new(1)
         board.revive 0, 0

         board.kill 0, 0

         expect(board.is_alive? 0, 0).to eq(false)
      end

      it 'should not die if trying to kill out of bounds cell' do
         board = Board.new(1)

         board.kill 1, 1
         board.kill 0, 1
      end
   end

   describe '#is_alive?' do
      it 'should be false by default' do
         board = Board.new 1

         expect(board.is_alive? 0, 0).to eq(false)
      end

      it 'should be false for larger boards by default' do
         board = Board.new 3

         expect(board.is_alive? 0, 0).to eq(false)
         expect(board.is_alive? 0, 1).to eq(false)
         expect(board.is_alive? 0, 2).to eq(false)
         expect(board.is_alive? 1, 0).to eq(false)
         expect(board.is_alive? 1, 1).to eq(false)
         expect(board.is_alive? 1, 2).to eq(false)
         expect(board.is_alive? 2, 0).to eq(false)
         expect(board.is_alive? 2, 1).to eq(false)
         expect(board.is_alive? 2, 2).to eq(false)
      end

      it 'should be false for unknown cells' do
         board = Board.new 1

         expect(board.is_alive? 99, 99).to eq(false)
         expect(board.is_alive? 0, 99).to eq(false)
      end

      it 'should be false for unknown cells again' do
         board = Board.new 2
         board.revive 0, 0
         board.revive 0, 1
         board.revive 1, 0
         board.revive 1, 1

         expect(board.is_alive? -1, 0).to eq(false)
         expect(board.is_alive? 0, -1).to eq(false)
         expect(board.is_alive? 2, 0).to eq(false)
         expect(board.is_alive? 0, 2).to eq(false)
         expect(board.is_alive? 0, 0).to eq(true)
      end
   end

   describe '#==' do
      describe 'empty boards' do
         it 'should be eq? if sizes are same' do
            expect(Board.new(1)).to eq(Board.new(1))
         end

         it 'should not be eq? if sizes are different' do
            expect(Board.new(2)).not_to eq(Board.new(1))
         end
      end

      describe 'full boards' do
         it 'should always be equal' do
            board1 = Board.new(1)
            board1.revive 0, 0

            board2 = Board.new(1)
            board2.revive 0, 0

            expect(board1).to eq(board2)
         end

         it 'should always be equal again' do
            board1 = Board.new(2)
            board1.revive 0, 0
            board1.revive 0, 1
            board1.revive 1, 0
            board1.revive 1, 1

            board2 = Board.new(2)
            board2.revive 0, 0
            board2.revive 0, 1
            board2.revive 1, 0
            board2.revive 1, 1

            expect(board1).to eq(board2)
         end
      end

      describe 'boards with only some alive cells' do
         it 'should be equal when they have the same live cells' do
            board1 = Board.new(2)
            board1.revive 1, 1

            board2 = Board.new(2)
            board2.revive 1, 1

            expect(board1).to eq(board2)
         end

         it 'should not be equal when they have different live cells' do
            board1 = Board.new(2)
            board1.revive 0, 0

            board2 = Board.new(2)
            board2.revive 1, 1

            expect(board1).not_to eq(board2)
         end

         it 'should not be equal when they have different live cells but some same cells' do
            board1 = Board.new(2)
            board1.revive 0, 0
            board1.revive 1, 1

            board2 = Board.new(2)
            board2.revive 1, 1

            expect(board1).not_to eq(board2)
         end

         it 'should not be equal when they have different live cells but some same cells again' do
            board1 = Board.new(2)
            board1.revive 0, 0

            board2 = Board.new(2)
            board2.revive 0, 0
            board2.revive 1, 1

            expect(board1).not_to eq(board2)
         end
      end
   end

   describe '#to_s' do
      it 'should give a good result' do
         board = Board.new(2)
         board.revive 0, 0
         board.revive 1, 1

         expect(board.to_s).to eq('board of size 2 with cells: (0, 0), (1, 1)')
      end

      it 'should give a good result even after maniuplation' do
         board = Board.new(2)
         board.revive 0, 0
         board.revive 1, 1
         board.kill 0, 0
         board.kill 1, 1

         expect(board.to_s).to eq('board of size 2 with cells: ')
      end
   end

   describe 'wtf' do
      it 'shouldnt wtf' do
         board = Board.new(2)
         board.revive 0, 0
         board.revive 0, 1
         board.revive 1, 0
         board.revive 1, 1

         expect(board.is_alive?(-1, -1)).to eq(false)
      end
   end
end








