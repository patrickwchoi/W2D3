class Board
    def initialize
        @grid = []
        (0...3).each do |row|
            temp_row=[]
            (0...3).each {|col| temp_row << '_'}
            @grid<<temp_row
        end
    end
    def valid?(position)
        if position[0]<@grid.length && position[1]<@grid.length
            return true
        else
            return false
            print('Error: Out of Bounds')
        end
    end
    def empty?(position)
        if @grid[position[0]][position[1]]=='_'
            return true
        else
            return false
        end
    end
    def place_mark(position, mark)
        if !self.valid?(position)
            raise 'Not valid position'
        elsif !self.empty?(position)
            raise 'Not empty'
        else
            @grid[position[0]][position[1]]=mark
        end
    end
    def print
        @grid.each {|row| p row}
    end
    def win_row?(mark)
        @grid.each {|row| return true if row.count(mark)==row.length}
        return false
    end
    def win_col?(mark)
        temp = @grid.transpose
        temp.each {|row| return true if row.count(mark)==row.length}
        return false
    end
    def win_diagonal?(mark)
        # @grid.each_with_index do |row, y|
        #     row.each_with_index do |col, x|
        #         if 
        if @grid[0][0]== mark && @grid[1][1]== mark && @grid[2][2]== mark
            return true
        elsif @grid[0][2]== mark && @grid[1][1]== mark && @grid[2][0]== mark
            return true
        else
            return false
        end
    end
    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end
    end
    def empty_positions?
        return true if @grid.flatten.count('_')>0
        return false
    end
end

b = Board.new
b.place_mark([0, 2], :X)
b.place_mark([1, 1], :X)
b.place_mark([2, 0], :X)
b.print
puts b.win?(:X)
puts b.empty_positions?

player_1 = HumanPlayer.new(:X)
puts player_1.mark
player_1.get_position