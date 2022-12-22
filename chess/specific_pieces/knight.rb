require_relative "../piece"

class Knight < Piece

    attr_reader :symbol
    
    def initialize(color, pos)
        super
        color = :black if color == "Black"
        color = :white if color == "White"
        @symbol = "♘".colorize(color)
    end

    def move_diffs

    end
end
