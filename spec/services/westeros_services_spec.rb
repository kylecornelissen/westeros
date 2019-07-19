require 'rails_helper'

RSpec.describe WesterosService do
  it "gets results" do
    service = WesterosService.new

    result = service.house_finder("stark")
    # having problems with services testing syntax; come back to this test
  end
end
