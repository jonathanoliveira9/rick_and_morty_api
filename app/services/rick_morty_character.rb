class RickMortyCharacter
  attr_accessor :params

  URL = 'https://rickandmortyapi.com/api'.freeze

  def initialize(params)
    @params = params
  end
  
  def all_characters
    page = params[:page]
    url = "/character"
    url.concat("?page=#{page}") if page.present?
    data = data_response(url)
    data.body
  end
    
  def character
    character_id = params[:id]
    data = data_response("/character/#{character_id}")
    data.body
  end

  private

  def data_response(params)
    Faraday.get(URL+params, { 'Accept': 'application/json' })
  end
end