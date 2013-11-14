require_relative 'tabletop'
require_relative 'square'

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
    if (x.to_i < @tabletop.get_x_max()) && (y.to_i < @tabletop.get_y_max()) && (@compass.invert[aspect] != nil)
      @location['x'] = x.to_i
      @location['y'] = y.to_i

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
    if @aspect == nil
      return
    end

    @aspect -= 1

    if @aspect < 0
      @aspect = 3
    end

    return
  end

  def right
    if @aspect == nil
      return
    end

    @aspect += 1

    if @aspect > 3
      @aspect = 0
    end

    return
  end

  def move
    if @aspect == nil
      return
    end

    if @aspect == @compass.invert["NORTH"]
      new_location = {
        'x' => @location['x'],
        'y' => @location['y'] + 1,
      }

      if @tabletop.get_square(new_location['x'], new_location['y'])
        @location = new_location
      else
        return
      end

    elsif @aspect == @compass.invert["EAST"]
      new_location = {
        'x' => @location['x'] + 1,
        'y' => @location['y'],
      }

      if @tabletop.get_square(new_location['x'], new_location['y'])
        @location = new_location
      else
        return
      end

    elsif @aspect == @compass.invert["SOUTH"]
      new_location = {
        'x' => @location['x'],
        'y' => @location['y'] - 1,
      }

      if @tabletop.get_square(new_location['x'], new_location['y'])
        @location = new_location
      else
        return
      end

    elsif @aspect == @compass.invert["WEST"]
      new_location = {
        'x' => @location['x'] - 1,
        'y' => @location['y'] ,
      }

      if @tabletop.get_square(new_location['x'], new_location['y'])
        @location = new_location
      else
        return
      end
    end
  end
end