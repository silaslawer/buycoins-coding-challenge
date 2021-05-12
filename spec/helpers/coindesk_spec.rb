require "rails_helper"
require "coindesk"
require "net/http"

describe "coindesk" do

  it "should return bitcoin price" do
    hash = '{ "time": { "updated": "Sep 18, 2013 17:27:00 UTC", "updatedISO": "2013-09-18T17:27:00+00:00" }, "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index. Non-USD currency data converted using hourly conversion rate from openexchangerates.org", "bpi": { "USD": { "code": "USD", "symbol": "$", "rate": "126.5235", "description": "United States Dollar", "rate_float": 126.5235 }, "GBP": { "code": "GBP", "symbol": "£", "rate": "79.2495", "description": "British Pound Sterling", "rate_float": 79.2495 }, "EUR": { "code": "EUR", "symbol": "€", "rate": "94.7398", "description": "Euro", "rate_float": 94.7398 } } }'
    allow(Coindesk).to receive(:get).and_return(hash)

    res = Coindesk.bitcoin_price :usd
    expect(res).to eq(126.5235)
  end

  it "calculates buying price" do
    price = Coindesk.calculate_buy_price(btc_price: 1234, margin: 0.2, exchange_rate: 100)
    expect(price).to eq(123646.8)
  end

  it "calculates selling price" do
    price = Coindesk.calculate_sell_price(btc_price: 1234, margin: 0.2, exchange_rate: 100)
    expect(price).to eq(123153.2)
  end
end
