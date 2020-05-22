require 'user'

describe User do
  describe ".create" do
    it 'adds a new user to the database' do
    user = User.create('test@test.com', 'password')
    users = User.all
    expect(users[0].email).to eq('test@test.com')
    end
  end

  describe ".find" do
    it "finds the user by id" do
      user = User.create('test@test.com', 'password')
      result = User.find(user.id)
      expect(result.email).to eq 'test@test.com'
      expect(result.id).to eq user.id
    end
  end

  describe ".authenticate" do
    it "returns a user given a correct username and password" do
      user = User.create('test@test.com', 'password')
      authenticated_user = User.authenticate('test@test.com', 'password')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create('test@example.com', 'password123')
  
      expect(User.authenticate('nottherightemail@me.com', 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create('test@test.com','password')
  
      expect(User.authenticate('test@test.com', 'wrongpassword')).to be_nil
    end
  end
end