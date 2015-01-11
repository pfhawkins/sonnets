require 'grape'
require 'json'

module Sonnet 
  class API < Grape::API
    format :json
    content_type :json, "application/vnd.api+json"

    get "/" do
      {:poets => { :shakespeare => { :href => "http://sonnets.hyperverses.com/shakespeare" }}}
    end

    get "/shakespeare" do
      {:links => { :id => "http://sonnets.hyperverses.com/shakespeare/:id"}}
    end

  end
end
