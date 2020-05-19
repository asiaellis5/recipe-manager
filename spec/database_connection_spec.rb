require 'database_connection'

describe ".setup" do
  it "sets up a connection to a database through PG" do
    expect(PG).to receive(:connect).with('recipe_manager_test')
    DatabaseConnection.setup('recipe_manager_test')
  end
end