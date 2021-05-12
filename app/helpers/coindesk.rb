class Coindesk
  include HTTParty
  base_uri "https://api.coindesk.com/v1"
  default_timeout 6000

  def self.bitcoin_price(currency)
    currency = currency.to_s.upcase
    response = get("/bpi/currentprice/#{currency}.json")
    JSON.parse(response)["bpi"][currency]["rate_float"]
  end

  def self.calculate_buy_price(btc_price:, margin:, exchange_rate:)
    margin = (btc_price * margin) / 100
    price = btc_price + margin
    price * exchange_rate
  end

  def self.calculate_sell_price(btc_price:, margin:, exchange_rate:)
    margin = (btc_price * margin) / 100
    price = btc_price - margin
    price * exchange_rate
  end
end
