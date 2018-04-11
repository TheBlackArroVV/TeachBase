module Accessors
  @@setter_values = {}

  def attr_accessor_with_history(*names)
    names.each do |name|
      variable = "@#{name}".to_sym

      define_method(name) { instance_variable_get(variable) }

      define_method("#{name}=".to_sym) do |value|
        @@setter_values["#{name}".to_sym] = [] if @@setter_values["#{name}".to_sym].nil?
        @@setter_values["#{name}".to_sym] << value
        instance_variable_set(variable, value)
      end

      define_method("#{name}_history".to_sym) { puts @@setter_values["#{name}".to_sym] }
    end

    def strong_attr_accessor(*params)
        variable = "@#{params[0]}".to_sym

        define_method("#{params[0]}".to_sym) { instance_variable_get(variable) }

        define_method("#{params[0]}=".to_sym) do |value|
          puts value.class
          if value.class == params[1]
            instance_variable_set(variable, value)
          else
            raise TypeError
          end
        end

    end
  end
end
