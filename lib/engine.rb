class Engine

  attr_reader :x
  attr_reader :y
  attr_reader :orientation

  @valid_orientations = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize
    @x = 0
    @y = 0
    @orientation = 'NORTH'
  end

  def command(input)
    if input == "MOVE"
      move
    elsif input == "LEFT"

    elsif input == "RIGHT"

    elsif input == "REPORT"
      report
    elsif /PLACE \d,\d,(NORTH|WEST|SOUTH|EAST)/.match(input)
      place(input.split[1].split(',')[0].to_i, input.split[1].split(',')[1].to_i, input.split[1].split(',')[2])
    end
  end

    private

    def place(x, y, f)
      @x = x
      @y = y
      @orientation = f
    end

    def move
      if @orientation == 'NORTH'
        @y += 1
      elsif @orientation == 'EAST'
        @x += 1
      elsif @orientation == 'SOUTH'
        @y -= 1
      elsif @orientation == 'WEST'
        @x -= 1
      end
    end

    def report
      return "Output: #{x}, #{y}, #{orientation}"
    end

end
