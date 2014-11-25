require 'spec_helper'

describe Sonnet::API do
  include Rack::Test::Methods

  def app
    Sonnet::API
  end

  describe Sonnet::API do
    describe 'GET /shakespeare' do
      it 'does not error out' do
        get "/shakespeare"
        expect(last_response.status).to eq(200)
        expect(last_response).to be_ok
      end

      it 'has an application/json content type' do
        header 'Content-Type', 'application/json'
        get "/shakespeare" #, {"CONTENT_TYPE" => "application/json"}
        expect(last_response.header).to include({"Content-Type" => "application/json"})
      end
    end
  end
end
