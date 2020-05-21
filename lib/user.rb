class User

  attr_reader :email, :password, :id
  
  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM users')
    result.map { |user| new(user['id'], user['email'], user['password']) }
  end

  def self.create(email, password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email, password;")
    result.map { |user| new(user['id'], user['email'], user['password']) }
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    result.map { |user| new(user['id'], user['email'], user['password']) }
  end
  
end