require 'spec_helper'
require 'json_spec'

describe Sonnet::API do
  include Rack::Test::Methods

  def app
    Sonnet::API
  end

  describe 'GET /' do
    it 'does not error out' do
      get "/"
      expect(last_response.status).to eq(200)
      expect(last_response).to be_ok
    end

    it 'has an application/vnd.api+json content type' do
      header 'Content-Type', 'application/vnd.api+json'
      get "/"
      expect(last_response.header).to include({"Content-Type" => "application/vnd.api+json"})
    end

    it 'contains a poets object' do
      get "/"
      expect(last_response.body).to have_json_path("poets")
      expect(last_response.body).to include_json(%("shakespeare"))
      expect(last_response.body).to be_json_eql(%({"poets":"shakespeare"}))
    end
  end
end
