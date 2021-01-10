class RickMortyCharacter
  attr_accessor :params

  URL = 'https://rickandmortyapi.com/api'.freeze

  def initialize(params)
    @params = params
  end
  
  def characters
    url = "/character#{filter_params}"
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

  def filter_params
    filter = %w[name status species type gender page]
    url = ''
    filter.each do |f|
      url.concat("?#{f}=#{params[f]}") if params[f].present?
    end
    url
  end
end
