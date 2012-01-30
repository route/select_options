require "test_helper"

class ActiveRecordBaseTest < ActiveRecord::TestCase
  def setup
    I18n.backend = I18n::Backend::Simple.new
    I18n.backend.store_translations 'en', :activerecord => { :attributes => { :shape => { :dimention_1 => "1D", :dimention_2 => "2D", :dimention_3 => "3D", :dimention_4 => "4D" } } }
  end

  def test_constant_for_attribute
    assert_equal [3, 4], Shape.constant_for_attribute(:dimention)
  end

  def test_constant_for_attribute_with_undefined_constant
    assert_equal nil, Shape.constant_for_attribute(:undefined_attribute)
  end

  def test_attribute_options
    assert_equal [["3D", 3], ["4D", 4]], Shape.attribute_options(:dimention)
  end

  def test_attribute_options_with_specified_constant
    assert_equal [["1D", 1], ["2D", 2]], Shape.attribute_options(:dimention, Shape::DIMENTION_VALUES)
  end

  def test_attribute_options_with_undefined_constant
    assert_equal nil, Shape.attribute_options(:undefined_attribute)
  end

  def test_attribute_options_with_wrong_constant
    assert_equal nil, Shape.attribute_options(:some, Shape::WRONG)
  end

  def test_checking_composite_attribute_name
    assert_equal true, Shape.composite_attribute_name?(:dimention)
  end

  def test_checking_composite_attribute_name_for_wrong_attribute
    assert_equal false, Shape.composite_attribute_name?(:undefined_attribute)
  end

  def test_instance_attribute_options
    assert_equal [["3D", 3], ["4D", 4]], Shape.new.attribute_options(:dimention)
  end

  def test_instance_checking_composite_attribute_name
    assert_equal true, Shape.new.composite_attribute_name?(:dimention)
  end
end
