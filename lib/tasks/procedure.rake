namespace :procedure do

  desc "export sql server procedure generate sql file"
  task export: :environment do
    values = ActiveRecord::Base.connection.select_values("select * from sys.procedures")
    values.each do |name|
      result = ActiveRecord::Base.connection.select_rows("sp_helptext #{name}")
      sql = result.flatten.join('')

      path = Rails.root.join('tmp/procedures', "#{name}.sql")
      File.delete(path) if File.exist?(path)

       f = File.new(path, 'w+')
       f.puts sql
       f.close
    end
  end

end