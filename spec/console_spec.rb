require 'console.rb'
require 'board.rb'

describe :Console do
   describe '#show' do
      it 'should display an empty board' do
         output_mock = spy('output')

         console = Console.new(output_mock)
         console.show(Board.new 3)

         expect(output_mock).to have_received(:print).with("   \n   \n   \n\n")
      end

      it 'should display a full board' do
         output_mock = spy('output')

         board = Board.new 2
         board.revive 0, 0
         board.revive 0, 1
         board.revive 1, 0
         board.revive 1, 1

         console = Console.new(output_mock)
         console.show(board)

         expect(output_mock).to have_received(:print).with("**\n**\n\n")
      end
   end
end
