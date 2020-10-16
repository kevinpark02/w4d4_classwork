require 'tdd'
require 'byebug'

describe 'TDD' do
    describe "Array#my_uniq" do
        it "should return unique array" do
            expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
        end

        it "should return unique elements in order of the array" do
            expect([2,3,1,3].my_uniq).to eq([2, 3, 1])
        end
    end

    describe "Array#two_sum" do
        it "finds pairs in the elements in the array that sums to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
        it "result should return a nested array from smaller to bigger index" do
            expect([-1, 0, 2, -2, 1].two_sum).not_to eq([[4, 0], [3, 2]])
        end
    end

    describe "Array#my_transpose" do
        rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]

        it "transposes a given array" do 
            expect(rows.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
        end

        it "only takes in 2D square arrays" do
            expect(rows[0]).to eq([0,1,2])
            expect(rows[1]).to eq([3,4,5])
            expect(rows[2]).to eq([6,7,8])
        end
    end

    describe "Array#stock_picker" do
        price_day = [10, 5, 22, 40, 8, 4, 12]
        
        it "finds index with lowest value and finds index with highest value" do
            expect(price_day.stock_picker).to eq([1, 3])
        end

        it "cannot sell stock before buying it" do 
            expect(price_day.stock_picker).to eq(price_day.stock_picker.sort)
        end
    end

    describe Hanoi do 
        subject(:hanoi) {Hanoi.new(4)}
        describe "#initialize" do 
            context "with valid arguments" do
                it "instantiate a board correctly" do
                    expect(hanoi.board).to eq([[1, 2, 3, 4], [], []])
                end
            end
        end

        describe "#valid_move?" do
            it "return true if end_pos is empty?" do
                expect(hanoi.valid_move?(0, 2)).to be_truthy
            end

            before(:each) do
                hanoi.board[2] << hanoi.board[0].pop
                hanoi.board[2] << hanoi.board[0].pop
                #[[1, 2], [], [3, 4]]         
            end

            it "return true if move is valid" do
                expect(hanoi.valid_move?(0,2)).to be_truthy
            end
            it "return false if move is not valid" do
                expect(hanoi.valid_move?(2,0)).to be_falsey
            end
        end
 
        describe "#move" do 
            before(:each) do
                hanoi.move(0, 1)
            end
            it "move selected disc to new location" do
                expect(hanoi.board).to eq([[2, 3, 4], [1], []])
            end
        end
 
        describe "#won?" do
            before(:each) do
                hanoi.won?
                # hanoi = Hanoi.new(4)
                # hanoi.board[2] = [1, 2, 3, 4]
                # hanoi.board[0] = []
            end
            #[[1, 2, 3, 4], [], []] << original
            #[[], [1, 2, 3, 4], []] 
            #[[], [],[1, 2, 3, 4] ]
            it "return true when all discs has successfully moved to another location" do
                expect(hanoi.board[0]).to eq([])
                expect(hanoi.board[]).to eq([1, 2, 3, 4])  #expect(hanoi.board[2]).to eq([1, 2, 3, 4])  #[1,2,3,4]
            end
        end
    end
end

