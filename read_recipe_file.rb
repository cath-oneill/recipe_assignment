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
		current_prep = "--"
		
		if ingredients_split[0].match(/\d+/)
			current_qty = ingredients_split[0].match(/\d+/).to_a[0].to_i
			ingredients_split.shift
		end

		array_of_units = ["oz", "tbs", "lbs", "cup", "cups"]
		if array_of_units.include?(ingredients_split[0])
			current_unit = ingredients_split[0]
			ingredients_split.shift
		end
		
		i = ingredients_split.find_index { |x| x.end_with?(",")}
		if i != nil
			x = ingredients_split.take(i+1)
			ingredients_split.shift(i+1)
			current_prep = ingredients_split.join(" ")
			ingredients_split = x
			ingredients_split[-1] = ingredients_split.last.chop
		end

		current_ingredient = Ingredient.new(current_qty, current_unit, ingredients_split.join(" "), current_prep)
		current_recipe.add_ingredient(current_ingredient)
		n += 1		

	end
	p current_recipe
end

