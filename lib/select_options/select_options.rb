module ActionView
  module Helpers
    class FormBuilder
      def select_with_options(method, options = {}, html_options = {})
        method_for_options = "#{method}_options"
        constant_for_options = method_for_options.pluralize.upcase
        choices = options_from_constant(constant_for_options) || options_from_method(method_for_options)
        select(method, choices, options, html_options)
      end

      private
        def options_from_constant(name)
          if options = @object.const_defined?(name)
            options.map { |value| [name_for_option(attribute_name, value), value] }
          end
        end

        def options_from_method(name)
          @object.send(name) if @object.respond_to?(name)
        end

        def name_for_option(attribute_name, value)
          @object.class.name_for_option(attribute_name, value)
        end
    end
  end
end
