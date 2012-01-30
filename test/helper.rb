$: << File.expand_path("../../lib", __FILE__)
$: << File.expand_path("../", __FILE__)
$:.uniq!

require "rubygems"
require "bundler/setup"
require "test/unit"
require "active_record"
require 'select_options'

module SelectOptions
  module Test

    def transaction
      ActiveRecord::Base.transaction { yield ; raise ActiveRecord::Rollback }
    end

    def with_instance_of(*args)
      model_class = args.shift
      args[0] ||= {:name => "a b c"}
      transaction { yield model_class.create!(*args) }
    end

    module Database
      extend self

      def connect
        version = ActiveRecord::VERSION::STRING
        driver  = SelectOptions::Test::Database.driver
        engine  = RUBY_ENGINE rescue "ruby"

        ActiveRecord::Base.establish_connection config[driver]
        message = "Using #{engine} #{RUBY_VERSION} AR #{version} with #{driver}"

        puts "-" * 72
        if in_memory?
          ActiveRecord::Migration.verbose = false
          Schema.up
          puts "#{message} (in-memory)"
        else
          puts message
        end
      end

      def config
        @config ||= YAML::load(File.open(File.expand_path("../databases.yml", __FILE__)))
      end

      def driver
        (ENV["DB"] or "sqlite3").downcase
      end

      def in_memory?
        config[driver]["database"] == ":memory:"
      end
    end
  end
end

class Module
  def test(name, &block)
    define_method("test_#{name.gsub(/[^a-z0-9']/i, "_")}".to_sym, &block)
  end
end

require "schema"
require "models"
SelectOptions::Test::Database.connect
# at_exit {ActiveRecord::Base.connection.disconnect!}