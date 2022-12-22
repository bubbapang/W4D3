require_relative "../piece"
require_relative "../board"

require_relative "modules/slideable"

class Bishop < Piece
    
include Slideable
    
    attr_reader :symbol, :color
    
    def initialize(color, pos)

        super
        color = :black if color == "Black"
        color = :white if color == "White"
        @symbol = "♗".colorize(color)

        # use the specific piece's current position, to determine an array of all the possible places it can move
            # each position has to be checked for: samecolor, inboard, inherent piece moves, and blocked?
        @possible_moves = []
    end

    def move_dirs
        diagonal_directions
    end

end
