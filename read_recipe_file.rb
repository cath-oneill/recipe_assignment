require_relative 'recipe_methods.rb'

text = File.read("recipes.txt").split("\n\n")
recipe_array = text.collect do |x|
	x.split("\n")
end

recipe_array.each_with_index do |recipe, i|
	current_recipe = Recipe.new(recipe[0], recipe[1].split.last.to_i)
	n = 2
	while n < recipe.size
		array_of_recipe_words = recipe[n].split
		current_qty = "--" #default value
		if array_of_recipe_words[0].match(/\d+/)
			current_qty = array_of_recipe_words[0].match(/\d+/).to_a[0].to_i
			array_of_recipe_words.shift
		end
		current_ingredient = Ingredient.new(current_qty, array_of_recipe_words.join(" "))
		n += 1		
		current_recipe.add_ingredient(current_ingredient)
	end
	p current_recipe
end

# ObjectSpace.each_object(Recipe) {|x| p x}
