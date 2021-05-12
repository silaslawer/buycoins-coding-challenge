require "rails_helper"

RSpec.describe GraphqlController, type: :controller do

  describe "GET #heartbeat" do
    it "returns successfully pings the api endpoint" do
      get :heartbeat
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #execute" do

    it "ensure hash params" do
      expect { post :execute, params: { query: "{ ambiguousField { id } ", variables: ["12345"] } }.to raise_exception(ArgumentError)
      allow(Rails.env).to receive(:development?).and_return(true)
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: "12345" } }.not_to raise_exception

      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: "" } }.not_to raise_exception
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: { test: "test" } } }.not_to raise_exception
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: { "hello" => "hi" } } }.not_to raise_exception
      expect { post :execute, params: { query: "{ ambiguousField { id } }", variables: nil } }.not_to raise_exception
    end

    it "returns a 500" do
      allow(Rails.env).to receive(:development?).and_return(true)
      post :execute, params: { query: "{ ambiguousField { id } ", variables: ["12345"] }
      expect(response.code).to eq("500")
    end
  end
end
