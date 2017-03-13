
class Button
    def initialize(window, type, x, y, close_value)
        @window = window
        @type = type
        @active = false
        @x = x
        @y = y
        @inactiveButton = Gosu::Image.new(@window, "Resources/#{type}.png")
        @activeButton = Gosu::Image.new(@window, "Resources/#{type}_a.png")
        @close_value = close_value
    end

    def active?
        if @window.mouse_x > @x and @window.mouse_x < (@x + @inactiveButton.width)
            if @window.mouse_y > @y and @window.mouse_y < (@y + @inactiveButton.height)
                true
            end
        end
        false
    end

    def update(&block)
        if active?
            @activeButton.draw(@x, @y, 1)
            block.call
        else
            @inactiveButton.draw(@x, @y, 1)
        end
    end
end
