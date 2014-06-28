class Meal < ActiveRecord::Base
	has_many :ratings

  def self.check_nutritional_facts(ingredients_string)
    ingredients_array = []
    # If there are commas in input, split into array, else make array of string
    if ingredients_string.include?(", ")
      ingredients_array = ingredients_string.split(", ")
    else
      ingredients_array.push(ingredients_string)
    end

    # check each element in array and split on with and remove and
    ingredients_array.each do |string|
      if string.include? "with "
        string.split("with ")
      end
      if string.include? "and "
        string.slice!("and ")
      end
    end

    # flatten array
    ingredients_array.flatten!

    ingredients_array.each do |string|
      string.gsub!(" ", "+")
    end

    return Sensum.nutrition_lookup(ingredients_array)
  end

end



