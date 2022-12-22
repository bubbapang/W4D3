module Slideable # what is this module doing?
    HORIZONTAL_INCREMENTS = [[0, 1], [1, 0], [-1, 0], [0, -1]].freeze
    DIAGONAL_INCREMENTS = [[-1, -1], [1, -1], [-1, 1], [1, 1]].freeze
                    # northwest, northeast, southwest, southeast
                    
    def horizontal_directions
        HORIZONTAL_INCREMENTS 
    end

    def diagonal_directions
        DIAGONAL_INCREMENTS
    end


    private

    # if Slideable was in the Rook Class, and the rook was at position 0,0; moves would contain: 

    #Rook 0,1 0,2 0,3
    #1,0 
    #2,0 
    #3,0

    def moves
        all_moves = []
    end

    def grow_unblocked_moves_in_dir(dx, dy)

    end

end