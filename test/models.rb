class Article < ActiveRecord::Base
  validates :kind, :title, :presence => true
  KINDS = %w(public private)
end