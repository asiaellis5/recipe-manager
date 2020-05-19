def add_recipe
  visit('/')
  fill_in :title, with: 'Halloumi'
  fill_in :url, with: 'https://www.mobkitchen.co.uk/recipes/halloumi-wrap'
  click_button('Add Recipe')
end

def create_recipes
  Recipe.create('http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower', 'Popcorn Cauliflower')
    Recipe.create('https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake', 'Pesto Veggie Traybake')
    Recipe.create('http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad', 'Haloumi Salad')
end