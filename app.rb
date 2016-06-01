require 'shoes'
require './lib/engine'

Shoes.app(title: 'Toy Robot Simulator', width: 800, height: 800, resizable: false) do

  stack margin: 5 do
    stack do
      title "Toy Robot Simulator"
    end

    stack do
      @vertical_offset = 0
      5.times do
        @horizontal_offset = 0
        5.times do
          flow do
            fill seashell
            rect(width: 100, left: @horizontal_offset, top: @vertical_offset)
            @horizontal_offset+=100
          end
        end
        @vertical_offset +=100
      end

      # @toy_robot = oval(left: 10, top: 10, radius: 20, fill: black)
      @token = image 'assets/token.png'

      @token.move(0, 100*4) #place in initial position
    end

    stack(top: 550) do
      para "Enter Command"
      flow do
        edit_line
        button "OK"
      end
    end

  end
end
