require "net/http"
class Coindesk
  def self.bitcoin_price(currency)
    currency = currency.to_s.upcase
    response = Net::HTTP.get(URI.parse("https://api.coindesk.com/v1/bpi/currentprice/#{currency}.json"))
    JSON.parse(response)["bpi"][currency]["rate_float"]
  end

  def self.calculate_buy_price(btc_price:, margin:, exchange_rate:)
    margin = (btc_price * margin) / 100
    price = btc_price + margin
    price * exchange_rate
  end
end
