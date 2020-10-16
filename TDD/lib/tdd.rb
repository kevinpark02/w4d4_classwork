class Array
    def my_uniq
        res = []

        self.each do |n|
            if !res.include?(n)
                res.push(n)
            end
        end
        res
    end

    def two_sum
        res = []

        self.each_with_index do |el1, i1|
            self.each_with_index do |el2, i2|
                if i2 > i1
                    if el1 + el2 == 0
                        res << [i1, i2]
                    end
                end
            end
        end
        res
    end

    def my_transpose
        res = []

        (0...self.length).each do |i|
            current = []
            self.each do |ele|
                current << ele[i]
            end
            res << current
            current = []
        end
        res
    end

    def stock_picker
        # price_day = [10, 5, 22, 40, 8, 4, 12]
        profit = 0
        last_idx = self.length - 1
        days = [] 
       (0...last_idx).each do |idx|
            (idx+1..last_idx).each do |next_idx|
                if self[next_idx] - self[idx] > 0 && self[next_idx] - self[idx] > profit
                    profit =  self[next_idx] - self[idx] 
                    days = [idx, next_idx]
                end
            end
        end
        days
    end
end
    # [ [1, 2], [4, 5], [3] ]
    # [ [] ,  [],  [1,2,3,4,5] ]
class Hanoi
    attr_accessor :board

    def initialize(size)
        @board = Array.new(3) {Array.new}
        (1..size).each do |disc|
            @board[0] << disc
        end
    end

    def valid_move?(first_pos, end_pos) #[ [1, 2], [4], [3, 5] ]
        return true if @board[end_pos].empty?

        if @board[first_pos].first > @board[end_pos].first
            return false
        else
            return true
        end 
    end

    def move(first_pos, end_pos)
        if valid_move?(first_pos, end_pos)
            shifted = @board[first_pos].shift
            @board[end_pos].unshift(shifted)
        end
    end

end