class Types::QueryType < Types::BaseObject
  field :calculate_price, Float, description: "Returns calculated price", null: true do
    argument :type, String, required: true
    argument :margin, Float, required: true
    argument :exchange_rate, Float, required: true
  end
  def calculate_price(type:, margin:, exchange_rate:)
    20.30
  end
end
