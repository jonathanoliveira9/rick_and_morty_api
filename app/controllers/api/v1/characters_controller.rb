class Api::V1::CharactersController < Api::V1::ApiController
  def index
    @response = ::RickMortyCharacter.new(params).characters
    render json: @response
  end

  def show
    @response = ::RickMortyCharacter.new(params).character
    render json: @response
  end
end