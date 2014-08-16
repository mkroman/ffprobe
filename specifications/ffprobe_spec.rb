require_relative 'spec_helper'

describe FFProbe do
  describe ".version" do
    it "should return the version constant" do
      expect(FFProbe.version).to eq FFProbe::Version
    end
  end
end
