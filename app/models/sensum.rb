class Sensum

  def self.nutrition_lookup(ingredient_array)
    lookup(ingredient_array, {})
  end

  def self.lookup(ingredient_array, data)
    ingredient_array.each do |food|
      response = api_check(food)
      if response["ingredientInfo"] != nil
        response["ingredientInfo"].each do |info|
          type = info["idOfTheNutrien"]
          value = info["value"]
          unit = info["unit"]
          if data[type] == nil
            data[type] = convert(value, unit)
          else
            data[type] += convert(value, unit)
          end
        end
      elsif food.include?("+")
        food_array = food.split("+")
        first_food = food_array.shift
        remainder = food_array.join("+")
        recheck_array = [first_food, remainder]
        lookup(recheck_array, data)
      end
    end
    return data
  end

  def self.api_check(food_item)
    result = HTTParty.get("http://www.klappo.com:8080/jesse/server/#{ENV['API_PATH']}#{ENV['API_ID']}#{ENV['API_KEY']}" + "ingredientLabel=#{food_item}&#{ENV['LANGUAGE']}")
    return result
  end

  def self.convert(num, unit)
    case unit
    when 'kj'
      num_result = num / 4.1855
    when 'mg'
      num_result = num / 1000
    else
      num_result = num
    end
    return num_result
  end

end