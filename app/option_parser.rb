# frozen_string_literal: true

require 'optparse'

Options = Struct.new(:rover, :camera, :earth_date)

class Parser
  def self.parse(options = {})
    args = Options.new

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: app.rb [options]'

      opts.on('-rROVER', '--rover=ROVER', 'Get photos taken only by this rover') do |n|
        args.rover = n.downcase
      end

      opts.on('-cCAMERA', '--camera=CAMERA', 'Get photos taken only with this camera') do |n|
        args.camera = n.downcase
      end

      opts.on('-dDATE', '--earth_date=DATE', 'Get photos taken only on this date') do |n|
        args.earth_date = n
      end

      opts.on('-h', '--help', 'Prints help') do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)

    args
  end
end
