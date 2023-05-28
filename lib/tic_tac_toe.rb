class TicTacToe

    attr_accessor :board


    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]



    def initialize
        empty= []
        9.times {empty << ' '}
        @board = empty
    end


    def display_board
       puts " #{board[0]} | #{board[1]} | #{board[2]} "
       puts "-----------"
       puts " #{board[3]} | #{board[4]} | #{board[5]} "
       puts "-----------"
       puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        user_input = input.to_i-1

    end

    def move (index, token = "X")
        board[index] = token
    end
# return false if position is empty
    def position_taken?(index)
        (board[index] != ' ')
    end
#return true if position is empty and within range
    def valid_move?(index)
        (board[index] == ' ')
    end
#number of turns that have been played - count and subtract empty spaces
    def turn_count
        9- board.count(' ')
    end
#'O' is the first player?? I think so
    def current_player
        turn_count.even? ? "X": "O"
    end

    def turn
        puts "Enter position "
        input = gets.chomp # get input. CHOMP removes newline xter (/n)

        #If the move is invalid, ask for a new move until a valid move is received.
        self.turn unless (1..9).include?(input.to_i)#triggers the method itself from the top

        position = self.input_to_index(input) #translate input to index

#If the move is valid, make the move and display the board.
        if valid_move?(position)
            move(position,self.current_player)
            self.display_board
        end

    end

    def won?
        WIN_COMBINATIONS.each do |combination|
            if [["X"], ["O"]].include?([board[combination[0]], board[combination[1]], board[combination[2]]].uniq)
                return combination
            end


        end

        false

    end
#return true if every position is filled
    def full?
        !board.include?(' ')
    end

    def draw?
        self.full? && !self.won? # if board is full and no one won
    end

    #check if anyone won or draw - could also check full? but redundant
    def over?
        self.won? || self.draw?
    end

    def winner
        if self.won?
            (self.current_player == "X")? "O": "X"
        end
    end


     def play
        until self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end


     end

end

