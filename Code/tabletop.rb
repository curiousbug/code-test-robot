class Tabletop
  def initialize xMax, yMax
    #the minimum size of tabletop to be created will be 1 x 1
    xMax = [xMax, 1].max
    yMax = [yMax, 1].max

    @tabletop = Array.new(xMax) { Array.new(yMax) }

    for x in 0..xMax - 1
      for y in 0..yMax - 1
        @tabletop[x][y] = Square.new
      end
    end
  end

  def get_x_max
    @tabletop.length
  end

  def get_y_max
    @tabletop[0].length
  end

  def get_square x, y
    if (x < get_x_max()) && (y < get_y_max())
      @tabletop[x][y]
    else
      nil
    end
  end
end