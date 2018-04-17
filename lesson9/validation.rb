module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *options)
      variable = "@#{name}_#{type}".to_sym
      validations[variable] = [] if validations[variable].nil?
      validations[variable] << "@#{name}".to_sym
      validations[variable] << type
      validations[variable] << options
    end

    def validations
      @validations ||= {}
    end
  end

  module InstanceMethods
    def validate!
      validations.each do |_key, value|
        puts value[0]
        validation = "#{value[1]}_validation"
        if !value[2][0].nil?
          send(validation, instance_variable_get(value[0]), value[2][0])
        else
          send(validation, instance_variable_get(value[0]))
        end
      end
      true
    end

    def validations
      @validations ||= {}
    end

    def valid?
      validate!
    rescue RuntimeError
      false
    end

    def presence_validation(variable)
      raise 'Can`t be blank' if variable == '' || variable.nil?
      true
    end

    def format_validation(variable, format)
      raise 'Not in REG EXP' if variable !~ format
      true
    end

    def type_validation(variable, type)
      raise 'It`s a mistake. Try again.' if variable.class != type
      true
    end
  end
end
