require 'spec_helper'

describe RunRobot do
  before :each do
    @robot_app = RunRobot.new
  end

  describe "#new" do    
    it "returns a RunRobot object" do
      @robot_app.should be_an_instance_of RunRobot
    end
  end
end