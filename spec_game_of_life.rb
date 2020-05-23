require 'rspec'
require_relative "game_of_life.rb"


describe 'game of life' do 

    let!(:world) { World.new }
    context 'world' do
        subject { World.new}

        it 'should create a new world object' do
            subject.is_a?(World).should be true
        end

        it 'should respond to proper attr accessor methods for rows, cols, cell_grid' do
            subject.should respond_to(:rows)
            subject.should respond_to(:cols)
            subject.should respond_to(:cell_grid)
            subject.should respond_to(:live_neighbors_around_cell)            
        end

        it 'should create array grid containing Cell objects' do
            subject.cell_grid.is_a?(Array).should be true
            subject.cell_grid.each do |row|
                row.is_a?(Array).should be true
                row.each do |col|
                    col.is_a?(Cell).should be true
                end
            end
        end

        it "should detect a neighbor to the north && north east" do 
            subject.cell_grid[0][1].should be_dead
            subject.cell_grid[0][1].alive = true
            subject.cell_grid[0][1].should be_alive
            subject.live_neighbors_around_cell(subject.cell_grid[1][1]).count.should == 1
            subject.live_neighbors_around_cell(subject.cell_grid[1][0]).count.should == 1
        end
    end

    context "Cell" do
        subject { Cell.new }

        it "should create a new cell" do
            subject.is_a?(Cell).should be true
        end

        it "should respond to proper methods, alive?" do
            subject.should respond_to(:alive)
            subject.should respond_to(:x)
            subject.should respond_to(:y)
        end

        it "should intialize properly" do 
            subject.alive.should be false
            subject.x.should == 0
            subject.y.should == 0
        end
    end

    context "Game" do
        subject{ Game.new }
        it "should create a new game" do
            subject.is_a?(Game).should be true
        end

        it "should respond to proper methods" do
            subject.should respond_to(:world)
            subject.should respond_to(:seeds)
        end

        it "should initialize properly" do
            subject.world.is_a?(World).should be true
            subject.seeds.is_a?(Array).should be true
        end

        it "should generate seeds properly" do 
            game = Game.new(world, [[1,2], [0,2]])
            world.cell_grid[1][2].should be_alive
            world.cell_grid[0][2].should be_alive
        end
    end 

    context 'Rules' do

        let!(:game) { Game.new }
        context "Rule 1: Any live cell with fewer than two live neighbours dies, as if by underpopulation." do 
            it "should kill a live cell with one live neighbor" do
                game = Game.new(world, [[1,0], [2,0]])
                game.tick! 
                world.cell_grid[1][0].should be_dead
                world.cell_grid[2][0].should be_dead
            end
        end
    end
end