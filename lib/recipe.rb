# frozen_string_literal: true

require 'database_connection'

class Recipe
  attr_reader :title, :url, :id

  def initialize(title, url, id)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM recipes')
    result.map { |recipe| new(recipe['title'], recipe['url'], recipe['id']) }
  end

  def self.create(url, title)
    result = DatabaseConnection.query("INSERT INTO recipes (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
  end

  def self.update(id, url, title)
    result = DatabaseConnection.query("UPDATE recipes SET url= '#{url}', title= '#{title}' WHERE id= '#{id}'")
  end

  def self.delete(id)
    result = DatabaseConnection.query("DELETE FROM recipes WHERE id = '#{id}'")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM recipes WHERE id = #{id};")
    self.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end
end
