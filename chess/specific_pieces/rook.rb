require_relative "../piece"
require_relative "modules/slideable"

class Rook < Piece

    include Slideable

    attr_reader :symbol, :color

    def initialize(color, pos)
        super
        color = :black if color == "Black"
        color = :white if color == "White"
        @symbol = "♖".colorize(color) 
        @capabilities = ["Straight"]
        
    end

    def move_dirs
        horizontal_directions
    end
end
