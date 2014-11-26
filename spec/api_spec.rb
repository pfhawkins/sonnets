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

      it 'has an application/vnd.api+json content type' do
        header 'Content-Type', 'application/vnd.api+json'
        get "/shakespeare"
        expect(last_response.header).to include({"Content-Type" => "application/vnd.api+json"})
      end
    end
  end
end
