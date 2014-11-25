require 'grape'
require 'json'

module Sonnet 
  class API < Grape::API
    get :shakespeare do
      header 'Content-Type', 'application/json'
    end
  end
end
