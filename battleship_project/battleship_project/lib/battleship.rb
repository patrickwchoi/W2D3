require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n)
        @player=Player.new()
        @board = Board.new(n)
        @remaining_misses = n*n/2
    end
    def start_game
        @board.place_random_ships
        puts "Num of ships: #{@board.num_ships}"
        @board.print
    end
    def lose?
        if @remaining_misses<=0
            print "you lose"
            return true
        else
            return false
        end
    end
    def win?
        if @board.num_ships == 0
            print 'you win'
            return true
        else 
            return false
        end
    end
    def game_over?
        return true if self.win?||self.lose?
        return false
    end
    def turn
        if @board.attack(@player.get_move)
            @board.print
            print @remaining_misses
        else
            @board.print
            @remaining_misses-=1
            print @remaining_misses
        end
    end
end
