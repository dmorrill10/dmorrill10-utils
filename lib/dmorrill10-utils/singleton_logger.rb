require 'logger'

class SingletonLogger < Logger
  @@log = Logger.new(STDOUT)

  def self.instance
    @@log
  end

  # @param [IO] file Log target file.
  def self.set_log_file!(file)
    @@log = Logger.new(file)

    self
  end

  def self.set_log_to_stdout!
    set_log_file!(STDOUT)
  end
  
  def self.set_log_to_stderr!
    set_log_file!(STDERR)
  end

  def self.respond_to_missing?(name, include_private=false)
    @@log.respond_to?(name, include_private) or super
  end
  
  private_class_method :new

  private

  def self.method_missing(method, *args, &block)
    @@log.send(method, *args, &block)
  end
end