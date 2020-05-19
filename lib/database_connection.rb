require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    PG.connect(dbname)
  end
end