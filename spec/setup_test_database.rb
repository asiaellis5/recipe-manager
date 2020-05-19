# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'setting up test database'

  connection = PG.connect(dbname: 'recipe_manager_test')

  connection.exec('TRUNCATE recipes;')
end
