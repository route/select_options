require "rubygems"
require "bundler/setup"
require "test/unit"
require "active_record"
require "select_options"

$:.push File.expand_path("../", __FILE__)
require "models/user"
require "models/shape"
