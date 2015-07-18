
require_relative 'game_of_life.rb'
require_relative 'initial_layout.rb'
require_relative 'output.rb'

iterations = ENV['ITERATIONS'].to_i
file = ENV['FILE']

path_to_file = File.join(Dir.pwd, file)
#file = File.join(File.dirname(__FILE__), '..', 'test_files', 'pulsar_example.txt')
#file = File.join(File.dirname(__FILE__), '..', 'test_files', '4by4_example.txt')
#file = File.join(File.dirname(__FILE__), '..', 'test_files', '3by3_example2.txt')

initial_board = InitialLayout.new(path_to_file).board
GameOfLife.new(Output.new, initial_board).play iterations
