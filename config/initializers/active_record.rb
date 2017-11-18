ActiveRecord::Base.table_name_prefix = 'dbo.'
# ActiveRecord::ConnectionAdapters::SQLServerAdapter.lowercase_schema_reflection = true

class ActiveRecord::Base

  class << self
    def table_name
      singularize = self.to_s
      pluralize = singularize.pluralize
      table = connection.tables.include?(pluralize) ? pluralize : singularize

      "#{table_name_prefix}#{table}"
    end

    # def primary_key
    #   connection.primary_key(table_name)
    # end
  end

end