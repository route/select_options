module SelectOptions
  # Create a select tag and a series of contained option tags for the provided object and method.
  # Helper would take options from model's constant and translations to them from translations file.
  # For example with @user:
  #  class User < ActiveRecord::Base
  #    ROLES = %w(admin user)
  #    ...
  #  end
  #
  # in the template:
  #  f.select_with_options :role
  # is the same that:
  #  f.select :role, User::ROLES.map { |value| [translation_for_this_value, value] }
  #
  # This helper takes parameters like a rails select.
  def select_with_options(method, options = {}, html_options = {})
    const_name = options.delete(:source)
    select(method, @object.attribute_options(method, const_name), options, html_options)
  end
end
