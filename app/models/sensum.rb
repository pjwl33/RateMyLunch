class Sensum

  API_PATH = 'ingredient/getIngredientInformation?'
  API_ID = 'appId=e4d47e80&'
  API_KEY = 'appKey=hackdining&'
  LANGUAGE = 'language=en'

  def self.nutrition_lookup(ingredient_array)
    data = {}
    ingredient_array.each do |food|
      response = HTTParty.get("http://www.klappo.com:8080/jesse/server/#{API_PATH}#{API_ID}#{API_KEY}" + "ingredientLabel=#{food}&#{LANGUAGE}")
      response["ingredientInfo"].each do |var|
        type = var["idOfTheNutrien"]
        value = var["value"]
        unit = var["unit"]
        if data[type] == nil
          data[type] = convert(value, unit)
        else
          data[type] += convert(value, unit)
        end
      end
    end
    return data
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