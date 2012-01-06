require 'spec_helper'
require 'turtle_tracks'

describe TurtleTracks do

  before :each do
    @o = TurtleTracks.new(File.expand_path(File.dirname(__FILE__)) + '/fixtures/test.logo')
  end

  it "should create canvas on initialization" do
    @o.size.should == 11
    @o.canvas.should == [
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . X . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . ."
    ]
  end

end


