require 'spec_helper'

describe Tabletop do
  before :each do
    @tabletop = Tabletop.new(5, 5)
  end

  describe "#new" do
    it "return a Tabletop object" do
      @tabletop.should be_an_instance_of Tabletop
    end
  end

  describe "#get_x_max" do
    it "returns the number of squares along the x axis" do
      @tabletop.get_x_max.should eql 5
    end
  end

  describe "#get_y_max" do
    it "returns the number of squares along the y axis" do
      @tabletop.get_y_max.should eql 5
    end
  end

  describe "#get_square" do
    context "invalid square" do
      it "returns null because the square does not exist" do
        @tabletop.get_square(100, 100).should eql nil
      end
    end

    context "valid square" do
      it "returns a square" do
        @tabletop.get_square(0,0).should be_an_instance_of Square
      end
    end
  end
end