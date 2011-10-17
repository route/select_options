module ActiveModel
  module Translation
    # Transforms composite attribute names into a more human format
    #
    #   Person.human_composite_attribute_name("role", "admin") # => "Administrator"
    #
    # Specify +options+ with additional translating options.
    def human_composite_attribute_name(attribute, value, options = {})
      default = :"#{i18n_scope}.composite_attributes.#{model_name.i18n_key}.#{attribute}.#{value}"
      human_attribute_name "#{attribute}_#{value}", options.reverse_merge(:default => default)
    end
  end
end
