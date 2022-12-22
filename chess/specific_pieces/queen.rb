require_relative "../piece"
require_relative ""
class Queen < Piece

    attr_reader :symbol
    
    def initialize(color, pos)
        super
        color = :black if color == "Black"
        color = :white if color == "White"
        @symbol = "♕".colorize(color)
    end

    def move_dirs
        
    end
end
