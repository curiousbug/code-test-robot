require_relative 'robot'
require_relative 'tabletop'
require_relative 'command_parser'

class RunRobot
  def initialize
    @robot = Robot.new(Tabletop.new(5, 5))

    for i in 0..ARGV.size - 1
      run_file(ARGV[i])
    end
  end

  def run_file filename
    commands = CommandParser.new(filename)

    command = commands.get_command

    while command
      if command == "MOVE"
        @robot.move
      elsif command == "LEFT"
        @robot.left
      elsif command == "RIGHT"
        @robot.right
      elsif command == "REPORT"
        puts @robot.report
      else
        place_args = command.split(/\s|,\s/)
        @robot.place(place_args[1], place_args[2], place_args[3])
      end

      command = commands.get_command
    end
  end
end