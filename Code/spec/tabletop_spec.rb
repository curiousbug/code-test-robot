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
    context "square does not exist" do
      it "returns nil because a Square does not exist at 100, 100" do
        @tabletop.get_square(100, 100).should eql nil
      end

      it "returns nil because a Square does not exist at -1, -1" do
        @tabletop.get_square(-1, -1).should eql nil
      end
    end

    context "square exists" do
      it "returns a square" do
        @tabletop.get_square(0,0).should be_an_instance_of Square
      end
    end
  end
end