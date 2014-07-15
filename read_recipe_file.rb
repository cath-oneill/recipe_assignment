require_relative 'recipe_methods.rb'

text = File.read("recipes.txt").split("\n\n")
recipe_array = text.collect do |x|
	x.split("\n")
end

recipe_array.each do |recipe|
	current_recipe = Recipe.new(recipe[0], recipe[1].split.last.to_i)
	n = 2
	while n < recipe.size
		ingredients_split = recipe[n].split
		current_qty = "--" #default value
		current_unit = "--"
		
		if ingredients_split[0].match(/\d+/)
			current_qty = ingredients_split[0].match(/\d+/).to_a[0].to_i
			ingredients_split.shift
		end

		array_of_units = ["oz", "tbs", "lbs", "cup", "cups"]
		if array_of_units.include?(ingredients_split[0])
			current_unit = ingredients_split[0]
			ingredients_split.shift
		end
		
		current_ingredient = Ingredient.new(current_qty, current_unit, ingredients_split.join(" "))
		n += 1		
		current_recipe.add_ingredient(current_ingredient)
	end
	p current_recipe
end

# ObjectSpace.each_object(Recipe) {|x| p x}
