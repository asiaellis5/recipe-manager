CREATE TABLE comments(id SERIAL PRIMARY KEY, comment VARCHAR(300), recipe_id INTEGER REFERENCES recipes (id));