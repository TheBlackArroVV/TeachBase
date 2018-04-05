module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    @@instances = 0

    def instances
      @@instances
    end

    protected

    def register_instance
      @@instances += 1
    end
  end

  module InstanceMethods
    include ClassMethods

    protected

    def register_instance
      self.class.register_instance
    end
  end
end
