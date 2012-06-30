class ProcessRunner

  # Starts an independent process asynchronously with the given +command+.
  # @param [Array] command The command to run.
  # @param [Hash] options Options with which the process should be started.
  # => (see IO#popen) for more information on available options.
  # @return [IO] Pipe to the started process.
  # @raise (see IO#popen)
  def self.go(command, options={})
    pipe = IO.popen command.push(options)

    Process.detach pipe.pid

    pipe
  end
end
