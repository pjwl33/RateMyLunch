class Sensum

  def self.nutrition_lookup(ingredient_array)
    data = {}
    ingredient_array.each do |food|
      response = HTTParty.get("http://www.klappo.com:8080/jesse/server/#{ENV['API_PATH']}#{ENV['API_ID']}#{ENV['API_KEY']}" + "ingredientLabel=#{food}&#{ENV['LANGUAGE']}")
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