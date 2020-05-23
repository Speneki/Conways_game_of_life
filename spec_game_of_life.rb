#describe game of life
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
        end

        
    end
end