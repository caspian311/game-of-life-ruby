require 'neighbor_counter.rb'

describe :NeighborCounter do
   describe '#count_neighbors' do
      describe 'empty 2x2 grid' do
         it 'should have no neighbors' do
            board = Board.new(2)

            expect(NeighborCounter.count_neighbors(board, 0, 0)).to eq(0)
            expect(NeighborCounter.count_neighbors(board, 0, 1)).to eq(0)
            expect(NeighborCounter.count_neighbors(board, 1, 0)).to eq(0)
            expect(NeighborCounter.count_neighbors(board, 1, 1)).to eq(0)
         end
      end

      describe 'full 2x2 grid' do
         it 'should have appropriate neighbors' do
            board = Board.new(2)
            board.revive 0, 0
            board.revive 0, 1
            board.revive 1, 0
            board.revive 1, 1

            expect(NeighborCounter.count_neighbors(board, 0, 0)).to eq(3)
            expect(NeighborCounter.count_neighbors(board, 0, 1)).to eq(3)
            expect(NeighborCounter.count_neighbors(board, 1, 0)).to eq(3)
            expect(NeighborCounter.count_neighbors(board, 1, 1)).to eq(3)
         end
      end

      describe 'diagonal line through a 3x3 grid' do
         it 'should count the number of live cell nearby' do
            board = Board.new(3)
            board.revive 0, 0
            board.revive 1, 1
            board.revive 2, 2

            expect(NeighborCounter.count_neighbors(board, 0, 0)).to eq(1)
            expect(NeighborCounter.count_neighbors(board, 0, 1)).to eq(2)
            expect(NeighborCounter.count_neighbors(board, 0, 2)).to eq(1)
            expect(NeighborCounter.count_neighbors(board, 1, 0)).to eq(2)
            expect(NeighborCounter.count_neighbors(board, 1, 1)).to eq(2)
            expect(NeighborCounter.count_neighbors(board, 1, 2)).to eq(2)
            expect(NeighborCounter.count_neighbors(board, 2, 0)).to eq(1)
            expect(NeighborCounter.count_neighbors(board, 2, 1)).to eq(2)
            expect(NeighborCounter.count_neighbors(board, 2, 2)).to eq(1)
         end
      end
   end
end

