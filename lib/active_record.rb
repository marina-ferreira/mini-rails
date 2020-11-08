require 'active_record/connection_adapter'

module ActiveRecord
  class Base
    def initialize(attributes = {})
      @attributes = attributes
    end

    def self.abstract_class=(value)
      # Not implemented
    end

    def self.find(id)
      attributes = connection.execute("SELECT * FROM posts WHERE id = #{id.to_i}").first

      new(attributes)
    end

    def self.all
      list = connection.execute("SELECT * FROM posts")
      list.map { |attributes| new(attributes) }
    end

    def self.establish_connection(options)
      # @@var is a class variable, shared across all instances
      @@connection = ConnectionAdapter::SqliteAdapter.new(options[:database])
    end

    def self.connection
      @@connection
    end

    # Returns records attribute value
    def method_missing(name, *args)
      columns = self.class.connection.columns('posts')

      if columns.include?(name)
        @attributes[name]
      else
        super
      end
    end
  end
end
