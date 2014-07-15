require_relative 'recipe_methods.rb'

text = File.read("recipes.txt").split("\n\n")
recipe_array = text.collect do |x|
	x.split("\n")
end

recipe_array.each_with_index do |recipe, i|
	current_recipe = Recipe.new(recipe[0], recipe[1].split.last.to_i)
	n = 2
	while n < recipe.size
		if recipe[n].start_with?("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
			current_ingredient = Ingredient.new(recipe[n].split.first.to_i, recipe[n].slice!(2..-1))
		else
			current_ingredient = Ingredient.new(recipe[n])
		end
		n += 1		
		current_recipe.add_ingredient(current_ingredient)
	end
	p current_recipe
end

# ObjectSpace.each_object(Recipe) {|x| p x}
