class Tabletop
  def initialize xMax, yMax
    @xMax = xMax
    @yMax = yMax
    @tabletop = Array.new(@xMax) { Array.new(@yMax) }

    for x in 0..@xMax - 1
      for y in 0..@yMax - 1
        @tabletop[x][y] = Square.new
      end
    end
  end
end