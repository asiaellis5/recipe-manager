require 'database_connection'

describe DatabaseConnection do

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

describe ".query" do
  it "executers a query via PG" do
    connection = DatabaseConnection.setup('recipe_manager_test')
    expect(connection).to receive(:exec).with("SELECT * FROM recipes;")
    DatabaseConnection.query("SELECT * FROM recipes;")
  end
end

end