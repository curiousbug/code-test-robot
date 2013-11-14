require 'spec_helper'

describe CommandParser do
  before :each do
    @parser = CommandParser.new("testfile1")
  end

  describe "#new" do
    it "returns a new CommandParser object reading from testfile1" do
      @parser.should be_an_instance_of CommandParser
    end
  end

  describe "#read" do
    context "valid file format" do
      it "reads a MOVE command" do
        @parser.get_command.should eql "MOVE"
      end

      it "reads a LEFT command" do
        @parser.get_command
        @parser.get_command.should eql "LEFT"
      end

      it "reads a RIGHT command" do
        @parser.get_command
        @parser.get_command
        @parser.get_command.should eql "RIGHT"
      end

      it "reads a REPORT command" do
        @parser.get_command
        @parser.get_command
        @parser.get_command
        @parser.get_command.should eql "REPORT"
      end

      it "reads a PLACE command" do
        @parser.get_command
        @parser.get_command
        @parser.get_command
        @parser.get_command
        @parser.get_command.should eql "PLACE 0, 0, NORTH"
      end
    end

    context "invalid file format" do
      it "returns nil for get_command because of invalid file format" do
        parser = CommandParser.new("testfile2")
        parser.get_command.should eql nil
      end
    end
  end
end