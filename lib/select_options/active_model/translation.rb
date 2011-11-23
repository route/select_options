module ActiveModel
  module Translation
    # Transforms composite attribute names into a humanized format.
    # Translations in en.yml for an ActiveRecord child looks like this:
    #  en:
    #    activerecord:
    #      composite_attributes:
    #        user:
    #          role:
    #            admin: Administrator
    #            user: User
    #
    #  User.human_composite_attribute_name("role", "user") # => "User"
    # or
    #  en:
    #    activerecord:
    #      attributes:
    #        user:
    #          role_admin: Administrator
    #          role_user: User
    #
    #  User.human_composite_attribute_name("role", "admin") # => "Administrator"
    # Specify +options+ with additional translating options.
    def human_composite_attribute_name(attribute, value, options = {})
      return "" unless value.present?
      default = :"#{i18n_scope}.composite_attributes.#{model_name.i18n_key}.#{attribute}.#{value}"
      human_attribute_name "#{attribute}_#{value}", options.reverse_merge(:default => default)
    end
  end
end
