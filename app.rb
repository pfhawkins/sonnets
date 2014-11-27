require 'grape'
require 'json'

module Sonnet 
  class API < Grape::API
    content_type :txt, "application/vnd.api+json"

    get "/" do
      "poets".to_json
    end

  end
end
