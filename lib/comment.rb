require_relative 'database_connection'

class Comment

  attr_reader :comment, :id, :recipe_id

  def initialize(id, comment, recipe_id)
    @id = id
    @comment = comment
    @recipe_id = recipe_id
  end
  
  def self.all
    result = DatabaseConnection.query('SELECT * FROM comments')
    result.map { |comment| new(comment['id'], comment['comment'], comment['recipe_id']) }
  end

  def self.create(comment, recipe_id)
    result = DatabaseConnection.query("INSERT INTO comments (comment, recipe_id) VALUES ('#{comment}', '#{recipe_id}') RETURNING id, comment, recipe_id;")
  end

  def self.where(recipe_id)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE recipe_id = #{recipe_id};")
    result.map { |comment| new(comment['id'], comment['comment'], comment['recipe_id']) }
  end
end