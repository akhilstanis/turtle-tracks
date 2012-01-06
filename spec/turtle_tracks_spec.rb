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

  it "should be able to change direction" do
    @o.change_direction("R",45).should == 1
    @o.change_direction("R",90).should == 3
    @o.change_direction("R",360).should == 3
    @o.change_direction("L",360).should == 3
    @o.change_direction("L",180).should == 7
    @o.change_direction("R",720).should == 7
  end

  it "should move according to command" do

    @o.dir = 0

    @o.command("RT 90")
    @o.dir.should == 2

    @o.command("FD 5")
    @o.canvas.should == [
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . X X X X X X",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . ."
    ]

    @o.command("RT 135")
    @o.dir.should == 5

    @o.command("FD 5")
    @o.canvas.should == [
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . X X X X X X",
      ". . . . . . . . . X .",
      ". . . . . . . . X . .",
      ". . . . . . . X . . .",
      ". . . . . . X . . . .",
      ". . . . . X . . . . ."
    ]
  end

  it "should process simple logo file" do
    @o.run
    @o.canvas.should == [
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . . . . . . .",
      ". . . . . X X X X X X",
      ". . . . . . . . . X .",
      ". . . . . . . . X . .",
      ". . . . . . . X . . .",
      ". . . . . . X . . . .",
      ". . . . . X . . . . ."
    ]

    @o1 = TurtleTracks.new(File.expand_path(File.dirname(__FILE__)) + '/fixtures/simple.logo')
    @o1.run
    pp @o1.canvas
  end


end




