require 'pp'

class TurtleTracks

  attr_accessor :canvas, :size, :dir

  def initialize path_to_logo_file
    File.open path_to_logo_file, "r" do |file|
      @logo = file.readlines
    end
    @output_file = "#{File.dirname(path_to_logo_file)}/#{File.basename(path_to_logo_file).split('.').insert(1,'_output.').join}"
    @size = @logo.shift(2).first.to_i
    @canvas = []
    @canvas[@size-1] = ". "
    @canvas.collect! do |row|
      (". " * @size).chop
    end
    @cursor = { :x => @size-1, :y => @size/2  }
    @canvas[@cursor[:y]][@cursor[:x]] = 'X'
    @dir = 0
  end

  def change_direction rotation, degrees
    @dir += rotation == "LT" ? -(degrees/45) : degrees/45
    @dir = @dir%8
    @dir < 0 ? @dir += 7 : @dir
  end

  def command cmd
    cmd = cmd.split " "
    case cmd[0]
    when "RT" || "LT"
      change_direction(cmd[0],cmd[1].to_i)
    when "FD"
      cmd[1].to_i.times do
        case @dir
        when 0
          @cursor[:y] -=1
        when 1
          @cursor[:x] +=2
          @cursor[:y] -=1
        when 2
          @cursor[:x] +=2
        when 3
          @cursor[:x] +=2
          @cursor[:y] +=1
        when 4
          @cursor[:y] +=1
        when 5
          @cursor[:x] -=2
          @cursor[:y] +=1
        when 6
          @cursor[:x] -=2
        when 7
          @cursor[:x] -=2
          @cursor[:y] -=1
        end
        @canvas[@cursor[:y]][@cursor[:x]] = "X"
      end
    end
  end

  def run
    @logo.each do |cmd|
      command cmd
    end
  end

end


# 0 y-1,x
# 1 y-1,x+1
# 2 y,x+1
# 3 y+1,x+1
# 4 y+1,x
# 5 y+1,x-1
# 6 y,x-1
# 7 y-1,x-1
