class Engine

  attr_reader :x
  attr_reader :y
  attr_reader :orientation

  def initialize
    @x = 0
    @y = 0
    @valid_orientations = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @orientation = 'NORTH'
    @placed = false;
  end

  def command(input)
    if input == "MOVE"
      move
    elsif input == "LEFT"
      left
    elsif input == "RIGHT"
      right
    elsif input == "REPORT"
      report
    elsif /PLACE (-)?\d*,(-)?\d*,(NORTH|WEST|SOUTH|EAST)/.match(input)
      place(input.split[1].split(',')[0].to_i, input.split[1].split(',')[1].to_i, input.split[1].split(',')[2])
    else
      raise 'Invalid Command Entered'
    end
  end

    private

    def move
      x, y = @x, @y
      if @orientation == 'NORTH'
        y = @y+1
      elsif @orientation == 'EAST'
        x = @x+1
      elsif @orientation == 'SOUTH'
        y = @y-1
      elsif @orientation == 'WEST'
        x = @x-1
      end

      if x > 0 && x < 4
        @x = x
      end
      if y > 0 && y < 4
        @y = y
      end

    end

    def left
      @orientation = @valid_orientations[@valid_orientations.index(@orientation)-1]
    end

    def right
      @orientation = @valid_orientations[@valid_orientations.index(@orientation)+1]
    end

    def report
      return "Output: #{x},#{y},#{orientation}"
    end

    def place(x, y, f)
      if (@placed == false)
        if (x < 0 || x > 4 || y < 0|| y > 4)
          raise 'Cannot Place Robot Toy Robot Outside of the Board\'s Boundaries'
        end

        @x = x
        @y = y
        @orientation = f
        @placed = true
      else
        raise 'Cannot Place Robot Toy More than Once'
      end
    end

end
