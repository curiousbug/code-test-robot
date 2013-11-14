require 'spec_helper'

describe Square do
  describe "#new" do
    it "returns a square object" do
      @square = Square.new
      @square.should be_an_instance_of Square
    end
  end
end