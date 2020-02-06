require 'byebug'
require 'rubygems'
require 'mixlib/cli'

class Practice
  include Mixlib::CLI

  option :config_file,
         :short => "-c CONFIG",
         :long  => "--config CONFIG",
         :default => 'config.rb',
         :description => "The configuration file to use"

  option :log_level,
         :short => "-l LEVEL",
         :long  => "--log_level LEVEL",
         :description => "Set the log level (debug, info, warn, error, fatal)",
         :required => true,
         :in => ['debug', 'info', 'warn', 'error', 'fatal'],
         :proc => Proc.new { |l| l.to_sym }

  option :help,
         :short => "-h",
         :long => "--help",
         :description => "Show this message",
         :on => :tail,
         :boolean => true,
         :show_options => true,
         :exit => 0


  option :debug,
         :short => "-d",
         :long => "--debug",
         :description => "Helps in debugggin",
         :on => :tail,
         :boolean => true,
         :show_options => true,
         :exit => 0



  option :timespass,
         :short => "-t",
         :long => "--timepass",
         :description => "just to waste time",
         :on => :tail,
         :boolean => true,
         :show_options => true,
         :exit => 0

end

#ARGV = [ '-c', 'foo.rb', '-l', 'debug' ]
pr =Practice.new
pr.parse_options
#pr.config[:config_file] # 'foo.rb'
#byebug
#
#
#p pr.config[:log_level]   # :debug
p  pr.config("#{timepass}")




