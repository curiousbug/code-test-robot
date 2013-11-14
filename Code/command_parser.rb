class CommandParser
  def initialize filename
    @command_list = Array.new

    File.open filename, "r" do |f|
      while line = f.gets
        new_command = is_move_command(line) ||
                      is_left_command(line) ||
                      is_right_command(line) ||
                      is_report_command(line) ||
                      is_place_command(line)

        if new_command
          @command_list << new_command.to_s.gsub("\n", "")
        else
          @command_list = nil
          return
        end
      end
    end
  end

  def get_command
    if @command_list != nil
      @command_list.shift
    else
      nil
    end
  end

  def is_move_command command
    command.to_s.match(/MOVE$/)
  end

  def is_left_command command
    command.to_s.match(/LEFT$/)
  end

  def is_right_command command
    command.to_s.match(/RIGHT$/)
  end

  def is_report_command command
    command.to_s.match(/REPORT$/)
  end

  def is_place_command command
    command.to_s.match(/PLACE [0-9]+, [0-9]+, NORTH$|EAST$|SOUTH$|WEST$/)
  end

  private  :is_move_command,
           :is_left_command,
           :is_right_command,
           :is_report_command,
           :is_place_command
end