class Recipe
	def initialize (name, servings)
		@name = name
		@servings = servings
		@ingredients = []
	end

	def add_ingredient (current_ingredient, current_amount = "to taste", current_unit = "--")
		@ingredients << {amount: current_amount, unit: current_unit, ingredient: current_ingredient}
	end
end

class RecipeList
	def initialize
		@recipelist = []
	end

	def add(recipe)
		@recipelist << recipe
	end
end



