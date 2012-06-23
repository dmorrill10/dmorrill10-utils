require File.expand_path('../abstract', __FILE__)

module Script
  include Abstract

  private

  def proper_usage?
    enforce_abstract __method__
  end

  def print_usage
    enforce_abstract __method__
  end

  def run_script_if_run_as_script(file_being_run)
    return unless file_being_run == $0
    
    if proper_usage?
      yield
    else
      print_usage
    end
  end
end
