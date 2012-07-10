# Spec helper (must include first to track code coverage with SimpleCov)
require_relative 'support/spec_helper'

require_relative '../lib/dmorrill10-utils/process_runner'

describe ProcessRunner do
  before do
    @pid = nil
  end

  describe '::go' do
    it 'starts a process asynchronously that can be killed by an external signal, and return its PIDs' do
      @pid = ProcessRunner.go(['sleep', '10'])

      check_process_exists

      cleanup
    end
  end
  
  def cleanup
    Process.kill 'KILL', @pid

    ->() { Process.getpgid(@pid) }.must_raise Errno::ESRCH
  end
  def check_process_exists
    begin
      Process.getpgid(@pid)
    rescue Errno::ESRCH => e
      flunk "Process with pid #{@pid} does not exist: #{e.message}"
    end
  end
end
