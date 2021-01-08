class Api::V1::CharactersController < Api::V1::ApiController
  def index
    render json: { test: 'Hello' }
  end
end