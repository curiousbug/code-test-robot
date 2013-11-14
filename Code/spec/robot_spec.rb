require 'spec_helper'

describe Robot do
  describe "#new" do
    it "returns a Robot object" do
      @robot = Robot.new
      @robot.should be_an_instance_of Robot
    end
  end
end