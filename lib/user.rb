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
  end
  
end