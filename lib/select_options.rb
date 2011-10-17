require "select_options/active_model/translation"
require "select_options/active_record/base"
require "action_controller"
require "select_options/select_options"

ActionView::Helpers::FormBuilder.send :include, SelectOptions
