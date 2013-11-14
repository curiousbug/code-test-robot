require_relative 'tabletop'

class Robot
  def initialize tabletop
    @tabletop = tabletop

    @location = {
      'x' => nil,
      'y' => nil,
    }

    @compass = {
      0 => "NORTH",
      1 => "EAST",
      2 => "SOUTH",
      3 => "WEST",
    }

    @aspect = nil
  end

  def place x, y, aspect
    if (x < @tabletop.get_x_max()) && (y < @tabletop.get_y_max()) && (@compass.invert[aspect] != nil)
      @location['x'] = x
      @location['y'] = y

      @aspect = @compass.invert[aspect]
    else
      return
    end
  end

  def report
    if @location['x'] && @location['y'] && (@compass[@aspect] != nil)
      "Output: " + @location['x'].to_s() + ", " + @location['y'].to_s() + ", " + @compass[@aspect]
    else
      return ""
    end
  end
end