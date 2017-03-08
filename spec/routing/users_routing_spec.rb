require "rails_helper"

RSpec.describe "Routing to users", :type => :routing do
  it "routes GET /users to users#index" do
    expect(:get => "/users").to route_to("users#index")
  end
end
