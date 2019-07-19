require 'rails_helper'

RSpec.describe WesterosService do
  it "gets results" do
    service = WesterosService.new

    result = service.house_finder("stark")
    require "pry"; binding.pry
    expect(result[:id]).to eq(1)
  end
end
