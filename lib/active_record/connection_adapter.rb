module ActiveRecord
  # Adapter Pattern: wraps several api's and adapts them to match our own.
  module ConnectionAdapter
    class SqliteAdapter
      def initialize(file)
        require 'sqlite3'
        @db = SQLite3::Database.new(file.to_s, results_as_hash: true)
      end

      # Execute an SQL query and return the results as an array of hashes.
      # Eg.:

      #   > adapter.execute "SELECT * FROM users"
      #   => [
      #     { id: 1, name: 'Marc' },
      #     { id: 2, name: 'Bob' }
      #   ]

      def execute(sql)
        @db.execute(sql).each do |row|
          row.keys.each do |key|
            value = row.delete(key)

            # only keep strings keys (ignore index-based keys, 0, 1, ...)
            row[key.to_sym] = value if key.is_a? String
          end
        end
      end

      # Return the column names of a table
      def columns(table_name)
        @db.table_info(table_name).map { |info| info['name'].to_sym }
      end
    end

    # Example implementation of another adapter in order to
    # support other DB engines

    # class MysqlAdapter
    #   def execute(sql)
    #     # Execute the query in MySQL
    #   end
    # end
  end
end
