require 'shoes'
require './lib/engine'

Shoes.app(title: 'Toy Robot Simulator', width: 800, height: 800, resizable: false) do

  #Init Game Engine
  @engine = Engine.new

  def move_token(token, start_x, start_y, end_x, end_y, start_orientation, end_orientation)
    puts start_x
    puts end_x
    puts start_y
    puts end_y


    x_delta = (start_x + end_x) * 100
    y_delta = (start_y + end_y) * 100

    #y_delta = 10
    puts x_delta
    puts y_delta

    puts token

    token.displace(x_delta, 100)
  end

  def refresh_log(text_box)
     text_box.replace @engine.log.join('\n')
  end

  stack margin: 5 do
    stack do
      banner "Toy Robot Simulator"
    end

    stack margin: 15 do
      vertical_offset = 0
      5.times do
        horizontal_offset = 0
        5.times do
          flow do
            fill seashell
            rect(width: 100, left: horizontal_offset, top: vertical_offset)
            horizontal_offset+=100
          end
        end
        vertical_offset +=100
      end

      @token = image 'assets/token.png'
      # move_token(@token, x, y, @engine.x, @engine.y, nil, nil)
      @token.displace(0, 400) #place in initial position
      @token.hide
    end

    stack(top: 570) do
      flow do
        para "Enter Command"
        flow do
          command_box = edit_line
          @submit_btn = button "Submit"
          @submit_btn.click do
            @engine.command(command_box.text)

            if @engine.placed
              @token.show
            end

          end

        end
      end
      flow do
        flow do
          subitle = "Command Log"
          log = caption
          refresh_log(log)
        end
      end
    end

  end
end
