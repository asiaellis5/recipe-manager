require 'comment'
require 'recipe'

describe Comment do

  describe ".create" do
    it 'adds a new comment to the database' do
      recipe = Recipe.create('https://www.mobkitchen.co.uk/recipes/halloumi-wrap', 'Haloumi Wrap')
      recipes = Recipe.all
      Comment.create('I am a comment', recipes[0].id )
      comments = Comment.all
      expect(comments[-1].comment).to eq('I am a comment')
    end
  end

  describe ".where" do
    it "gets the relevant comments from the database" do
      recipe = Recipe.create('https://www.mobkitchen.co.uk/recipes/halloumi-wrap', 'Haloumi Wrap')
      recipes = Recipe.all
      Comment.create('I am a comment', recipes[0].id )
      Comment.create('I am a second comment', recipes[0].id )

      comments = Comment.where(recipes[0].id)

      expect(comments.length).to eq 2
      expect(comments[0].comment).to eq 'I am a comment'
    end
  end
  
end