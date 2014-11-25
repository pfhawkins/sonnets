require 'grape'
require 'json'

module Sonnet 
  class API < Grape::API
    get :shakespeare do
      content_type "application/json"
    end
  end
end
