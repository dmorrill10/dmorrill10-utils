require File.expand_path('../abstract', __FILE__)

require 'clive'

module Script
  include Abstract

  private

  def proper_usage?(parsed_arguments)
    enforce_abstract __method__
  end

  def print_usage
    puts @options_parser.help
  end

  def register_arguments
    @options_parser = Class.new(Clive)
    yield @options_parser
  end

  def run_script_if_run_as_script(script_file, arguments=ARGV)
    return unless script_file == $0

    unless @options_parser
      @options_parser = Class.new(Clive)
    end
    @options_parser.config name: File.basename(script_file, '.rb')

    parsed_arguments = @options_parser.run arguments

    if proper_usage? parsed_arguments
      yield parsed_arguments
    else
      print_usage
    end
  end
end
