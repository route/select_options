require "helper"

class SelectOptionsTest < Test::Unit::TestCase
  def test_classes
    I18n.backend.store_translations(:en, :activerecord => {
      :composite_attributes => {
        :article => {
          :kind => {
            :public => "Item for all",
            :private => "Private item"
          }
        }
      } 
    })
    assert_equal(
      "Private item",
      Article.human_composite_attribute_name("kind", "private")
    )
    assert_equal(
      "Item for all",
      Article.human_composite_attribute_name("kind", "public")
    )
  end
end