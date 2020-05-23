require 'rspec'
require_relative "game_of_life.rb"

describe 'game of life' do 
    context 'world' do
        subject { World.new}

        it 'should create a new world object' do
            subject.is_a?(World).should be true
        end

        it 'should respond to proper methods' do
            subject.should respond_to(:rows)
            subject.should respond_to(:cols)
            subject.should respond_to(:cell_grid)            
        end

        it 'should create array grid on init' do
            subject.cell_grid.is_a?(Array).should be true
            subject.cell_grid.each do |row|
                row.is_a?(Array).should be true
            end
        end

    end
end