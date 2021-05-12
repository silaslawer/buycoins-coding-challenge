require "rails_helper"

RSpec.describe GraphqlController, type: :controller do
  describe "calucatePrice queries" do

    it "return buy price" do
      allow(Coindesk).to receive(:bitcoin_price).with(:usd).and_return(1234)

      query = <<-GRAPHQL
      {
        calculatePrice(type: "Buy", margin: 0.2, exchangeRate: 100)
      }
      GRAPHQL

      post :execute, params: { query: query }
      price = JSON.parse(response.body)["data"]["calculatePrice"]
      expect(price).to eq(123646.8)
    end

    it "return sell price" do
      allow(Coindesk).to receive(:bitcoin_price).with(:usd).and_return(1234)

      query = <<-GRAPHQL
      {
        calculatePrice(type: "Sell", margin: 0.2, exchangeRate: 100)
      }
      GRAPHQL

      post :execute, params: { query: query }
      price = JSON.parse(response.body)["data"]["calculatePrice"]
      expect(price).to eq(123153.2)
    end
  end
end
