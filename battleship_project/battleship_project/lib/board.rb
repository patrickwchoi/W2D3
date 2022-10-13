class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(' ')
        end
    end
    def initialize(n)
        @grid=[]
        (0...n).each do |row|
            temp_row=[]
            (0...n).each {|col| temp_row << :N}
            @grid<<temp_row
        end
        @size = n*n
    end
    def [](position)
        return @grid[position[0]][position[1]]
    end
    def []=(position,value)
        @grid[position[0]][position[1]] = value
    end
    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        if self[position] == :S #can also do self.[](position)
            self[position]=:H 
            puts 'you sunk my battleship!' #why cant print work here?
            return true
        else
            self[position]=:X 
            return false
        end
    end
    def place_random_ships
        while @grid.flatten.count(:S)<@grid.flatten.length/4
            n=@grid.length
            row_i, col_i= rand(n) , rand(n)
            @grid[row_i][col_i] = :S
        end
    end
    def hidden_ships_grid
        hidden = @grid.map do |row|
            row.map do |el|
                if el==:S
                    el=:N 
                else
                    el #idg map, why is el=el necesary #act just el works bc it needs something to add to array u return
                end
            end
        end
        return hidden
    end
    def cheat
        Board.print_grid(@grid) #why Board and not self? ig bc its class method
    end
    def print
        Board.print_grid(hidden_ships_grid)
    end
end
