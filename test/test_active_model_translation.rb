require 'test_helper'

class ActiveModelTranslationTests < ActiveModel::TestCase
  def setup
    I18n.backend = I18n::Backend::Simple.new
    I18n.backend.store_translations 'en', :activemodel => { :composite_attributes => { :user => { :role => { :admin => "Administrator", :user => "User" } } } }
    I18n.backend.store_translations 'en', :activemodel => { :attributes => { :user => { :role_guest => "Guest" } } }
  end

  def test_translated_human_composite_attribute_name
    assert_equal "Administrator", User.human_composite_attribute_name("role", "admin")
    assert_equal "User", User.human_composite_attribute_name("role", "user")
  end

  def test_translated_human_composite_attribute_name_with_empty_value
    assert_equal "", User.human_composite_attribute_name("role", "")
  end

  def test_translated_human_composite_attribute_name_with_nil_value
    assert_equal "", User.human_composite_attribute_name("role", nil)
  end

  def test_translated_human_composite_attribute_name_in_fallback_location
    assert_equal "Guest", User.human_composite_attribute_name("role", "guest")
  end
end
