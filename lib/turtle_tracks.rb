require 'pp'

class TurtleTracks

  attr_accessor :canvas, :size

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
    @canvas[@size/2][@size-1] = 'X'
  end

end
