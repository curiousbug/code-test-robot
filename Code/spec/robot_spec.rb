require 'spec_helper'

describe Robot do
  before :each do
    @tabletop = Tabletop.new(5, 5)
    @robot = Robot.new(@tabletop)
  end

  describe "#new" do
    it "returns a Robot object" do
      @robot.should be_an_instance_of Robot
    end
  end

  describe "#report and #place" do
    context "robot is off table:" do
      it "robot has not been placed" do
        @robot.report.should eql ""
      end

      it "robot has been placed in an invalid location" do
        @robot.place(100, 100, "NORTH")
        @robot.report.should eql ""
      end        
    end

    context "robot is on the table:" do
      it "robot has been placed in a valid location" do
        @robot.place(0, 0, "NORTH")
        @robot.report.should eql "Output: 0, 0, NORTH"
      end

      it "robot has been placed in an invalid location" do
        @robot.place(0, 0, "NORTH")
        @robot.place(100, 100, "NORTH")
        @robot.report.should eql "Output: 0, 0, NORTH"
      end
    end
  end
end