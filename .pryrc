# encoding: utf-8
Pry.config.editor = "subl -w"

Pry.config.history.file = "~/.irb_history"

Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> "
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

if defined?(Rails)
  begin
    require "rails/console/app"
    require "rails/console/helpers"
    TOPLEVEL_BINDING.eval("self").extend ::Rails::ConsoleMethods # ???
  rescue LoadError => e
    require "console_app"
    require "console_with_helpers"
  end
end

begin
  require 'awesome_print'
  #Pry.config.print = proc { |output, value| output.puts value.ai }
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
rescue LoadError => err
  puts "no awesome_print :("
end
