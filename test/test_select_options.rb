require "test_helper"

class SelectOptionsTests < ActionView::TestCase
  def setup
    @shape = Shape.new
  end

  def test_select_with_options
    fields_for :shape, @shape do |f|
      f.expects(:select).with(:dimention, [["3D", 3], ["4D", 4]], {}, {})
      f.select_with_options :dimention
    end
  end

  def test_select_with_options_with_source
    fields_for :shape, @shape do |f|
      f.expects(:select).with(:dimention, [["1D", 1], ["2D", 2]], {}, {})
      f.select_with_options :dimention, :source => Shape::DIMENTION_VALUES
    end
  end
end
