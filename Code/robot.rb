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

  def left
    @aspect -= 1

    if @aspect < 0
      @aspect = 3
    end

    return
  end

  def right
    @aspect += 1

    if @aspect > 3
      @aspect = 0
    end

    return
  end

  def move
    if @aspect == @compass.invert["NORTH"]
      newLocation = {
        'x' => @location['x'],
        'y' => @location['y'] + 1,
      }

      if @tabletop.get_square(newLocation['x'], newLocation['y'])
        @location = newLocation
      else
        return
      end

    elsif @aspect == @compass.invert["EAST"]
      newLocation = {
        'x' => @location['x'] + 1,
        'y' => @location['y'],
      }

      if @tabletop.get_square(newLocation['x'], newLocation['y'])
        @location = newLocation
      else
        return
      end

    elsif @aspect == @compass.invert["SOUTH"]
      newLocation = {
        'x' => @location['x'],
        'y' => @location['y'] - 1,
      }

      if @tabletop.get_square(newLocation['x'], newLocation['y'])
        @location = newLocation
      else
        return
      end

    elsif @aspect == @compass.invert["WEST"]
      newLocation = {
        'x' => @location['x'] - 1,
        'y' => @location['y'] ,
      }

      if @tabletop.get_square(newLocation['x'], newLocation['y'])
        @location = newLocation
      else
        return
      end
    end
  end
end