require 'spec_helper'

describe Tabletop do
  describe "#new" do
    it "return a Tabletop object" do
      @tabletop = Tabletop.new(5, 5)
      @tabletop.should be_an_instance_of Tabletop
    end
  end
end