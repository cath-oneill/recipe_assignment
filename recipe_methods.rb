class Recipe
	def initialize (name, servings)
		@name = name
		@servings = servings
		@ingredients = []
	end

	def add_ingredient (ingredient)
		@ingredients << ingredient
	end
end

class Ingredient
	def initialize (quantity, units, ingredient)
		@quantity = quantity
		@units = units
		@ingredient = ingredient
	end
end

# class RecipeList
# 	def initialize
# 		@recipelist = []
# 	end

# 	def add(recipe)
# 		@recipelist << recipe
# 	end
# end



