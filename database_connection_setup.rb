# frozen_string_literal: true

require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('recipe_manager_test')
else
  DatabaseConnection.setup('recipe_manager')
end
