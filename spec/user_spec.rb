require 'user'

describe User do
  describe ".create" do
    it 'adds a new user to the database' do
    user = User.create('test@test.com', 'password')
    users = User.all
    expect(users[0].email).to eq('test@test.com')
    expect(users[0].password).to eq('password')
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
end