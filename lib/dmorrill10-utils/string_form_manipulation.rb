module StringFormManipulation
  # @return This string in camel-case class name form.
  def to_camel_case
    class_name = to_s.capitalize
    class_name.gsub(/[_\s]+./) { |match| match = match[1,].capitalize }
  end

  alias_method :to_class_name, :to_camel_case
end

class String
  include StringFormManipulation
end

class Symbol
  include StringFormManipulation
end
