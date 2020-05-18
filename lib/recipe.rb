require 'pg'

class Recipe

  attr_reader :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end


  def self.all
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec('SELECT * FROM recipes')
    result.map { |recipe| self.new(recipe['title'], recipe['url'])}
  end

  def self.create(url, title)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec("INSERT INTO recipes (url, title) VALUES ('#{url}', '#{title}');")
  end
end