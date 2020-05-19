# frozen_string_literal: true

require 'pg'

class Recipe
  attr_reader :title, :url, :id

  def initialize(title, url, id)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec('SELECT * FROM recipes')
    result.map { |recipe| new(recipe['title'], recipe['url'], recipe['id']) }
  end

  def self.create(url, title)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec("INSERT INTO recipes (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
  end

  def self.update(id, url, title)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec("UPDATE recipes SET url= '#{url}', title= '#{title}' WHERE id= '#{id}'")
  end

  def self.delete(id)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec("DELETE FROM recipes WHERE id = '#{id}'")
  end

  def self.find(id)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'recipe_manager_test') : connection = PG.connect(dbname: 'recipe_manager')
    result = connection.exec("SELECT * FROM recipes WHERE id = #{id};")
    self.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end
end
