require 'spec_helper'

describe Square do
  before :each do
    @square = Square.new
  end

  describe "#new" do
    it "returns a square object" do
      @square.should be_an_instance_of Square
    end
  end

  describe "#robot_can_occupy" do
    it "returns true if the robot can occupy this square" do
      @square.robot_can_occupy.should eql true
    end
  end
end