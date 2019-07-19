class HouseSearchFacade
  attr_reader :house
  def initialize(house)
    @house = house
  end

  def members_count
    house = westeros_service.house_finder(@house)
    member_list = house[:attributes][:members]
    member_list.count
  end

  def house_name
    house = westeros_service.house_finder(@house)
    house[:attributes][:name]
  end

  def members_list
    house = westeros_service.house_finder(@house)
    house[:attributes][:members]
  end

  private

  attr_reader :house

  def westeros_service
    WesterosService.new
  end
end
