require_relative "display"

class Game

    attr_reader :board, :display

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        # @players = {}
        # @current_player = :B # could be white too
    end

    def start
        @board.populate_board!
        @display.render

        while true
            play_turn
        end
    end

    def play_turn
        puts "What piece do you want to pickup?" # answer could be "0 0"
        start_position = gets.chomp.split

        puts "Where do you want to place it?"
        end_position = gets.chomp.split

        start_position.map! { |ele| ele.to_i }
        end_position.map! { |ele| ele.to_i }

        board.move_piece(start_position, end_position) # needs in array format
        display.render
    end









    
    # private:

    # def notify_players

    # end

    # def swap_turn!

    # end
end
