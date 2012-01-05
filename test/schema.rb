module SelectOptions
  module Test
    class Schema < ActiveRecord::Migration
      class << self
        def down
          tables.each do |name|
            drop_table name
          end
        end

        def up
          # TODO: use schema version to avoid ugly hacks like this
          # return if @done

          tables.each do |table_name|
            create_table :articles do |t|
              t.string :title
              t.string :kind
            end
          end
          @done = true
        end

        private

        def tables
          ["articles"]
        end
      end
    end
  end
end