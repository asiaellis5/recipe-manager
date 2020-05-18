require 'pg'

class Recipe


  def self.all
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec('SELECT * FROM recipes')
    result.map { |recipe| recipe['url']}
  end

  def self.create(url)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec("INSERT INTO recipes (url) VALUES ('#{url}');")
  end
end