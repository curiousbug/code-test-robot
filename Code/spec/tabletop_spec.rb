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
end