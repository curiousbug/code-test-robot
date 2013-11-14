class Square
  #allows for extension by overloading this method
  #eg TreeSquare extends Square, robot_can_occupy
  #overloaded will return false.
  def robot_can_occupy
    true
  end
end