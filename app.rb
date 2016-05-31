require 'shoes'

Shoes.app(title: 'Toy Robot Simulator') do

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
            fill red
            rect(width: 60, left: @horizontal_offset, top: @vertical_offset)
            @horizontal_offset+=60
          end
        end
        @vertical_offset +=60
      end
    end

    stack(top: 350) do
      fill nil
      para "Enter Command"
      flow do
        edit_line
        button "OK"
      end
    end

  end
end
