class ActiveRecord::Base
  def self.human_attribute_name_for_option(attribute_name, value = nil, options = {})
    attribute_name = "#{attribute_name}_#{value}" if value.present?
    human_attribute_name attribute_name, options
  end
  alias :name_for_option :human_attribute_name_for_option
end
