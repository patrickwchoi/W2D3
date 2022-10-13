class HumanPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value=mark_value
    end
    def get_position
        print "Input your position with row and col number. ex. 1 2"
        return gets.chomp.split(' ').map{|i|i.to_i}        
    end
end