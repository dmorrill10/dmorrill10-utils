
require File.expand_path('../class', __FILE__)

module Abstract
  exceptions :method_not_implemented

  private

  def abstract_class_name
    self.class.ancestors.each_index do |i|
      current_module_name = Module.nesting.last
      if self.class.ancestors[i] == current_module_name
        return self.class.ancestors[i - 1]
      end
    end
    ''
  end

  def enforce_abstract(method)
    raise MethodNotImplemented, "Please redefine #{abstract_class_name}##{method}"
  end
end
