
require File.expand_path('../string_form_manipulation', __FILE__)

class Class
  private

  # @param [Array] names A list of exception names that the calling class would
  #  like to define.
  def exceptions(*names)
    names.each do |name|
      error_name = name.to_class_name
      const_set(error_name, Class.new(RuntimeError))
    end
  end

  def alias_new(alias_of_new)
    alias_class_method alias_of_new, :new
  end

  # @param [#to_sym] alias_method A class method to alias the class method, +method_to_alias+.
  # @param [#to_sym] method_to_alias A class method to be aliased by +alias_method+.
  def alias_class_method(alias_method, method_to_alias)
    singleton_class.alias_method_in_singleton_context alias_method.to_sym, method_to_alias.to_sym
  end

  # Must do this operation in singleton context
  class << self
    def alias_method_in_singleton_context(alias_method, method_to_alias)
      alias_method alias_method, method_to_alias
    end
  end
end
