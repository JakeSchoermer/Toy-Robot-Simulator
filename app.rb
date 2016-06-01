require 'shoes'
require './lib/engine'

app = Shoes.app(title: 'Toy Robot Simulator', width: 800, height: 800, resizable: false) do

  #Init Game Engine
  @engine = Engine.new
  @token_start_x_pixel_pos = 0
  @token_start_y_pixel_pos = 400

  # Methods
  def move_token(token)
    x_pixel_pos = @token_start_x_pixel_pos + @engine.x*100
    y_pixel_pos = (@token_start_y_pixel_pos - @engine.y*100)
    token.displace(x_pixel_pos, y_pixel_pos)
  end

  def set_token_orientation(token)
    if @engine.orientation == "NORTH"
      @token.path = 'assets/token_north.png'
    elsif @engine.orientation == "EAST"
      @token.path = 'assets/token_east.png'
    elsif @engine.orientation == "SOUTH"
      @token.path = 'assets/token_south.png'
    elsif @engine.orientation == "WEST"
      @token.path = 'assets/token_west.png'
    end
  end

  def refresh_log(text_box)
    string = <<-EOF
    EOF

    @engine.log.each do |item|
      string << "#{item}\n"
    end

    text_box.replace(string)
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

      @token = image 'assets/token_north.png'
      @token.displace(@token_start_x_pixel_pos, @token_start_y_pixel_pos) # place in initial position
      @token.hide # hidden until placed
    end

    stack(top: 580) do
      flow do
        nofill
        stack width: 385 do
          subtitle "Enter Command"
          flow do
            command_box = edit_line
            @submit_btn = button "Submit"
            @submit_btn.click do

              start_x = @engine.x
              start_y = @engine.y
              start_orientation = @engine.orientation

              @engine.command(command_box.text)

              # Move token
              move_token(@token)

              # Update Orientation
              set_token_orientation(@token)

              if @engine.placed
                @token.show
              end

              refresh_log(@log)
            end
          end
        end
        stack width: 385 do
          subtitle "Command Log"
          @log = caption
          refresh_log(@log)
        end
      end
    end

  end
end
