require 'grape'
require 'json'

module Sonnet 
  class API < Grape::API
    content_type :txt, "application/vnd.api+json"

    get "/" do
    end

  end
end
