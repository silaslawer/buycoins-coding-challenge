class Coindesk
    include HTTParty
    base_uri "https://api.coindesk.com/v1"
    default_timeout 6000


    def self.bitcoin_price(currency)
      currency = currency.to_s.upcase
      response = get("/bpi/currentprice/#{currency}.json")
      JSON.parse(response)["bpi"][currency]["rate_float"]
    end
end