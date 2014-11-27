require 'spec_helper'
require 'json_spec'

describe Sonnet::API do
  include Rack::Test::Methods

  def app
    Sonnet::API
  end

  describe Sonnet::API do
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
    end
  end
end
