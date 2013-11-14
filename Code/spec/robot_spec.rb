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

  describe "#left" do
    it "turns robot left" do
      @robot.place(0, 0, "NORTH")
      @robot.left
      @robot.report.should eql "Output: 0, 0, WEST"
    end

    it "turns robot left twice" do
      @robot.place(0, 0, "NORTH")
      @robot.left
      @robot.left
      @robot.report.should eql "Output: 0, 0, SOUTH"
    end

    it "turns robot left three times" do
      @robot.place(0, 0, "NORTH")
      @robot.left
      @robot.left
      @robot.left
      @robot.report.should eql "Output: 0, 0, EAST"
    end

    it "turns robot left four times" do
      @robot.place(0, 0, "NORTH")
      @robot.left
      @robot.left
      @robot.left
      @robot.left
      @robot.report.should eql "Output: 0, 0, NORTH"
    end
  end

  describe "#right" do
    it "turns robot right" do
      @robot.place(0, 0, "NORTH")
      @robot.right
      @robot.report.should eql "Output: 0, 0, EAST"
    end

    it "turns robot right twice" do
      @robot.place(0, 0, "NORTH")
      @robot.right
      @robot.right
      @robot.report.should eql "Output: 0, 0, SOUTH"
    end

    it "turns robot right three times" do
      @robot.place(0, 0, "NORTH")
      @robot.right
      @robot.right
      @robot.right
      @robot.report.should eql "Output: 0, 0, WEST"
    end

    it "turns robot right four times" do
      @robot.place(0, 0, "NORTH")
      @robot.right
      @robot.right
      @robot.right
      @robot.right
      @robot.report.should eql "Output: 0, 0, NORTH"
    end
  end

  describe "#move" do
    context "robot cannot move" do
      it "since it is facing NORTH at NORTH edge 0,4" do
        @robot.place(0, 4, "NORTH")
        @robot.move
        @robot.report.should eql "Output: 0, 4, NORTH"
      end

      it "since it is facing NORTH at NORTH edge 1,4" do
        @robot.place(1, 4, "NORTH")
        @robot.move
        @robot.report.should eql "Output: 1, 4, NORTH"
      end

      it "since it is facing NORTH at NORTH edge 2,4" do
        @robot.place(2, 4, "NORTH")
        @robot.move
        @robot.report.should eql "Output: 2, 4, NORTH"
      end

      it "since it is facing NORTH at NORTH edge 3,4" do
        @robot.place(3, 4, "NORTH")
        @robot.move
        @robot.report.should eql "Output: 3, 4, NORTH"
      end

      it "since it is facing NORTH at NORTH edge 4,4" do
        @robot.place(4, 4, "NORTH")
        @robot.move
        @robot.report.should eql "Output: 4, 4, NORTH"
      end

      it "since it is facing EAST at EAST edge 4,0" do
        @robot.place(4, 0, "EAST")
        @robot.move
        @robot.report.should eql "Output: 4, 0, EAST"
      end

      it "since it is facing EAST at EAST edge 4,1" do
        @robot.place(4, 1, "EAST")
        @robot.move
        @robot.report.should eql "Output: 4, 1, EAST"
      end

      it "since it is facing EAST at EAST edge 4,2" do
        @robot.place(4, 2, "EAST")
        @robot.move
        @robot.report.should eql "Output: 4, 2, EAST"
      end

      it "since it is facing EAST at EAST edge 4,3" do
        @robot.place(4, 3, "EAST")
        @robot.move
        @robot.report.should eql "Output: 4, 3, EAST"
      end

      it "since it is facing EAST at EAST edge 4,4" do
        @robot.place(4, 4, "EAST")
        @robot.move
        @robot.report.should eql "Output: 4, 4, EAST"
      end

      it "since it is facing SOUTH at SOUTH edge 0,0" do
        @robot.place(0, 0, "SOUTH")
        @robot.move
        @robot.report.should eql "Output: 0, 0, SOUTH"
      end

      it "since it is facing SOUTH at SOUTH edge 1,0" do
        @robot.place(1, 0, "SOUTH")
        @robot.move
        @robot.report.should eql "Output: 1, 0, SOUTH"
      end

      it "since it is facing SOUTH at SOUTH edge 2,0" do
        @robot.place(2, 0, "SOUTH")
        @robot.move
        @robot.report.should eql "Output: 2, 0, SOUTH"
      end

      it "since it is facing SOUTH at SOUTH edge 3,0" do
        @robot.place(3, 0, "SOUTH")
        @robot.move
        @robot.report.should eql "Output: 3, 0, SOUTH"
      end

      it "since it is facing SOUTH at SOUTH edge 4,0" do
        @robot.place(4, 0, "SOUTH")
        @robot.move
        @robot.report.should eql "Output: 4, 0, SOUTH"
      end


      it "since it is facing WEST at WEST edge 0,0" do
        @robot.place(0, 0, "WEST")
        @robot.move
        @robot.report.should eql "Output: 0, 0, WEST"
      end

      it "since it is facing WEST at WEST edge 0,1" do
        @robot.place(0, 1, "WEST")
        @robot.move
        @robot.report.should eql "Output: 0, 1, WEST"
      end

      it "since it is facing WEST at WEST edge 0,2" do
        @robot.place(0, 2, "WEST")
        @robot.move
        @robot.report.should eql "Output: 0, 2, WEST"
      end

      it "since it is facing WEST at WEST edge 0,3" do
        @robot.place(0, 3, "WEST")
        @robot.move
        @robot.report.should eql "Output: 0, 3, WEST"
      end

      it "since it is facing WEST at WEST edge 0,4" do
        @robot.place(0, 4, "WEST")
        @robot.move
        @robot.report.should eql "Output: 0, 4, WEST"
      end
    end
  end
end