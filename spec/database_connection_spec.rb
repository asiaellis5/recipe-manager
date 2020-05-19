require 'database_connection'

describe ".setup" do
  it "sets up a connection to a database through PG" do
    expect(PG).to receive(:connect).with(dbname: 'recipe_manager_test')
    DatabaseConnection.setup('recipe_manager_test')
  end

  it "keeps the connection persistent" do
    connection = DatabaseConnection.setup('recipe_manager_test')
    expect(DatabaseConnection.connection).to eq connection 
  end
end