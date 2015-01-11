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
      expect(last_response.body).to have_json_path("poets/shakespeare")
    end

    it 'links to the shakespeare poet ala JSON-API' do
      get "/"
      expect(last_response.body).to have_json_path("poets/shakespeare/href")
      expect(last_response.body).to include_json(%("http://sonnets.hyperverses.com/shakespeare")).at_path("poets/shakespeare/href")
    end
  end

  describe "GET /shakespeare" do

    it 'provides a url template for getting sonnets by id', :shakespeare => true do
      get "/shakespeare"
      expect(last_response.body).to have_json_path("links") 
      expect(last_response.body).to include_json(%("http://sonnets.hyperverses.com/shakespeare/:id")).at_path("links/id")
    end

    it 'provides a url template for getting sonnet lines by id and line'
    it 'provides a link to getting a random sonnet'
    it 'provides a url template for getting a random line from a particular sonnet'
    it 'provides a link to getting a random line from a random sonnet'
  end
end
