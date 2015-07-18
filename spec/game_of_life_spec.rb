require 'game_of_life.rb'
require 'console.rb'

describe :GameOfLife do
   describe '#play' do
      describe '3 by 3' do
         before do
            @output = spy('Output')

            threeByThree = Board.new(3)
            threeByThree.revive 1, 0
            threeByThree.revive 1, 1
            threeByThree.revive 1, 2
            @testObject = GameOfLife.new(@output, threeByThree)
         end

         it 'should display initial positions first' do
            @testObject.play 1

            expect(@output).to have_received(:print).with("   \n***\n   \n\n")
         end

         it 'should display updated values next' do
            @testObject.play 2

            expect(@output).to have_received(:print).once.ordered.with("   \n***\n   \n\n")
            expect(@output).to have_received(:print).once.ordered.with(" * \n * \n * \n\n")
         end

         it 'should signal the output that we finished' do
            emptyBoard = Board.new(1)
            @testObject = GameOfLife.new(@output, emptyBoard)
            @testObject.play 1

            expect(@output).to have_received(:done).once
         end
      end
   end
end
