require 'bcrypt'

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
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return nil unless result.any?
    return nil unless BCrypt::Password.create(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end
  
end