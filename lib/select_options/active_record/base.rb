module ActiveRecord
  class Base
    def self.attribute_options(name)
      constant_name = name.to_s.pluralize.upcase
      if const_defined?(constant_name)
        const_get(constant_name).map { |value| [human_composite_attribute_name(name, value), value] }
      end
    end

    def attribute_options(name)
      self.class.attribute_options(name)
    end

    def self.composite_attribute_name?(name)
      attribute_options(name).present?
    end

    def composite_attribute_name?(name)
      self.class.composite_attribute_name?(name)
    end
  end
end
