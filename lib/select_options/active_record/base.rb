module ActiveRecord
  class Base
    def self.attribute_options(name, source_constant = nil)
      constant = source_constant.presence || constant_for_attribute(name)
      constant.map { |value| [human_composite_attribute_name(name, value), value] } if constant.present?
    end

    def self.constant_for_attribute(name)
      constant_name = name.to_s.pluralize.upcase
      const_get(constant_name) if const_defined?(constant_name)
    end

    def attribute_options(name, source_constant = nil)
      self.class.attribute_options(name, source_constant)
    end

    def self.composite_attribute_name?(name)
      attribute_options(name).present?
    end

    def composite_attribute_name?(name)
      self.class.composite_attribute_name?(name)
    end
  end
end
