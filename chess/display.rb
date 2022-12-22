require_relative "board.rb"
require "pp"
require "colorize"
class Display
    
    def initialize(board)
        @board = board.grid # board is an instance, not a 2d array
        # @cursor = Cursor.new
    end

    def render
        # replaces objects with symbols
        symbol_board = @board.map do |row| 
            row.map do |piece_instance|
                # unless piece.is_a?(Pawn)
                piece_instance.symbol
            end
        end
        
        coordinates = [0,1,2,3,4,5,6,7]

        puts "  #{coordinates.join(" ").colorize(:blue)}" # 2 spaces
        symbol_board.each_with_index do |symbol_row, i|
            puts "#{coordinates[i].to_s.colorize(:blue)} #{symbol_row.join(" ")}"
        end
    end

end

# coordinates = [0,1,2,3,4,5,6,7]

#         puts "  #{coordinates.join("|").colorize(:blue)}|" # this is the top coordinate row
#         symbol_board.each_with_index do |symbol_row, i|
#             puts "----------------------|"
#             puts "#{coordinates[i].to_s.colorize(:blue)} | #{symbol_row.join("|")}|"
#         end