# http://westerosapi.herokuapp.com/api/v1/house/stark?api_key=egg

class WesterosService
  def house_finder(house)
    fetch_data("house/#{house}?api_key=#{ENV["api_key"]}")[:data].first
  end

  private

  def conn # connection
    Faraday.new(url: "http://westerosapi.herokuapp.com/api/v1") do |faraday|
      faraday.params['api_key'] = ENV["api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
