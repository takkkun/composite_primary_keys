module ActiveRecord
  module ConnectionAdapters
    class AbstractAdapter
      alias original_quote_column_name quote_column_name

      def quote_column_name(name)
        puts "HOGE: #{name.inspect}"
        Array(name).map do |col|
          original_quote_column_name(col.to_s)
        end.join(CompositePrimaryKeys::ID_SEP)
      end
    end
  end
end
