module Api
  module Internal
    class ApiController < ApplicationController
      respond_to :json
    end
  end
end
