require 'delegate'
require 'awesome_print'

class DebugHash < DelegateClass(Hash)
  def initialize(hash)
    @value = hash

    super @value
  end
  alias_method :to_s, :awesome_inspect
  alias_method :inspect, :awesome_inspect
end