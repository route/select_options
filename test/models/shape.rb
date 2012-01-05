class Shape < ActiveRecord::Base
  DIMENTION_VALUES = [1, 2]
  DIMENTIONS = [3, 4]
  WRONG = "some value"

  def attributes_from_column_definition
    { "id" => nil }
  end
end
