class Types::QueryType < Types::BaseObject
  field :calculate_price, Float, description: "Returns calculated price", null: true do
    argument :type, String, required: true
    argument :margin, Float, required: true
    argument :exchange_rate, Float, required: true
  end
  def calculate_price(type:, margin:, exchange_rate:)
    btc_price = Coindesk.bitcoin_price(:usd)

    return Coindesk.calculate_buy_price(btc_price: btc_price, margin: margin, exchange_rate: exchange_rate) if type.downcase == "buy"

    Coindesk.calculate_sell_price(btc_price: btc_price, margin: margin, exchange_rate: exchange_rate)
  end
end
