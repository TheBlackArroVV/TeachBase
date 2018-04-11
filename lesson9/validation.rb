module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(name, type, *params)
      variable = "@#{name}".to_sym
      puts variable = instance_variable_get(variable)
      puts name
      puts variable
      if type == :presence
        if variable.nil? || variable == ""
          raise 'Can`t be blank'
        end
      elsif type == :format
        puts variable
        if variable !~ params[0]
          raise 'Not in REG EXP'
        end
      elsif type == :type
        if variable != params[0]
          raise 'It`s a mistake. Try again.'
        end
      end
    end

  end

  module InstanceMethods
    def validate!
      self.class.validate :field, :presence
    end

    def valid?
      validate!
    end
  end

end
