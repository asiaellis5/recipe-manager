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
  end
end