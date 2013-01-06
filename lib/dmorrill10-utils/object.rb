class Object
  def to_h
    Hash[instance_variables.map do |var| 
      [var[1..-1].to_sym, instance_variable_get(var)]
    end]
  end
end