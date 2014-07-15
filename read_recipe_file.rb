require_relative 'recipe_methods.rb'

text = File.read("recipes.txt")
text.each_line do |line|
	puts line + "hi!"
end