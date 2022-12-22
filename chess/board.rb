require_relative "specific_pieces/bishop"
require_relative "specific_pieces/king"
require_relative "specific_pieces/knight"
require_relative "specific_pieces/null"
require_relative "specific_pieces/pawn"
require_relative "specific_pieces/queen"
require_relative "specific_pieces/rook"

class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
    end

    # def totally_valid?
    #     # if inboard and NOT same color
    # end







    def same_color?(start_piece, end_piece)
        return start_piece.color == end_piece.color
    end

    def outside_board?(pos)
        return false if self[pos] == nil
    end

    def blocked_path?
        # this method requires the paths that specific pieces can take in a turn
    end

    def is_path_straight?(start_pos, end_pos)
        # returns what the math says...
    end

    def is_path_diagonal?(start_pos, end_pos)
        # returns what the math says...
    end

    def move_piece(start_pos, end_pos)
        start_piece = self[start_pos]
        end_piece = self[end_pos]
        
        if same_color?(start_piece, end_piece)
            puts "You're trying to take your teammate!"
            return
        end

        if outside_board(end_pos)
            puts "You're trying to move outside of the board!"
            return
        end

        self[end_pos] = start_piece

        self[start_pos] = @null_piece

        # p start_piece.class # print the name of the specific piece: "Rook", "Bishop"
    end







    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val) # pos=[0,0]
        x, y = pos
        @grid[x][y] = val
    end

    def print_board_positions
        @grid.each_with_index do |row, i|
            row.each_with_index do |tile, j|
                p pos = [i, j]
            end
        end
    end

    def populate_board!
        black_important_row = [:Rook, :Knight, :Bishop, :Queen, :King, :Bishop, :Knight, :Rook]
        pawn_row = [:Pawn, :Pawn, :Pawn, :Pawn, :Pawn, :Pawn, :Pawn, :Pawn]
        null_row = [:NullPiece, :NullPiece, :NullPiece, :NullPiece, :NullPiece, :NullPiece, :NullPiece, :NullPiece]
        white_important_row = [:Rook, :Knight, :Bishop, :King, :Queen, :Bishop, :Knight, :Rook]

        pawn_row_indices = [1, 6]
        null_row_indices = [2, 3, 4, 5]

        @grid.each_with_index do |row, row_idx|
            if row_idx == 0 # if its the first row
                # place the black important row pieces
                black_important_row.each_with_index do |black_piece, black_piece_idx|
                    black_piece_position = [row_idx, black_piece_idx]
                    self[black_piece_position] = factory(black_piece, black_piece_position)
                end

            elsif pawn_row_indices.include?(row_idx)
                # place pawns
                pawn_row.each_with_index do |pawn_piece, pawn_piece_idx|
                    pawn_piece_position = [row_idx, pawn_piece_idx]
                    self[pawn_piece_position] = factory(pawn_piece, pawn_piece_position)
                end

            elsif null_row_indices.include?(row_idx)
                # place null pieces
                null_row.each_with_index do |null_piece, null_piece_idx|
                    null_piece_position = [row_idx, null_piece_idx]
                    self[null_piece_position] = factory(null_piece, null_piece_position)
                end

            elsif row_idx == 7
                # place white important row pieces
                white_important_row.each_with_index do |white_piece, white_piece_idx|
                    white_piece_position = [row_idx, white_piece_idx]
                    self[white_piece_position] = factory(white_piece, white_piece_position)
                end
            end
        end
        p @grid # make this beautiful
    end

    def factory(piece, position) # turns a symbol into an instance, returns the instance

        # lets put the rook @ 0,0 on the board as an instance

        # from the position, we can infer the color of the piece

            # each piece needs a position, color
            # we have the positions where each piece should be
            # we can assign color based on the row that piece starts on
        row, col = position

        # piece needs a color and a position
        color = "Black" if row < 2 # first 2 rows are black rows
        color = "White" if row > 5 # last 2 rows are white rows

        # ex: [:Rook, :Knight, :Bishop, :Queen, :King, :Bishop, :Knight, :Rook]

        # this logic takes care of the important rows' instances for both black and white
        if piece == :Rook
            return Rook.new(color, position)
        elsif piece == :Knight
            return Knight.new(color, position)
        elsif piece == :Bishop
            return Bishop.new(color, position)
        elsif piece == :Queen
            return Queen.new(color, position)
        elsif piece == :King
            return King.new(color, position)
        end

        if piece == :Pawn
            return Pawn.new(color, position)
        end

        if piece == :NullPiece
            return @null_piece
        end
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end
    
    def dup
    end
end
