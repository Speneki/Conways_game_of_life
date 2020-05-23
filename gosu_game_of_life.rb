require 'gosu'
require_relative 'game_of_life'

class GameWindow < Gosu::Window
    def initialize
        super 640, 480,false
        self.caption = "Conways Game of Life"
    end

    def update
    end

    def draw
    end

    def needs_cursor?
        true
    end
end


GameWindow.new.show