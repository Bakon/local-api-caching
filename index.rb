require 'json'
require 'sinatra'
require 'httparty'

POKE_API_URL = 'https://pokeapi.co/api/v2/'
LOCAL_API_URL = 'http://localhost:4567/api/v2/'
cache = {}

def fix_api_urls obj_or_arr
  return obj_or_arr.map {|value| fix_api_urls value} if obj_or_arr.is_a? Array

  obj_or_arr.reduce({}) do |hash, (key, value)|
    value = value.map{|value| fix_api_urls value} if value.is_a? Array

    value = value.sub(POKE_API_URL, LOCAL_API_URL) if value.is_a?(String) && value.start_with?(POKE_API_URL)

    hash[key] = value

    hash
  end
end

if [condition] [then]
else [condition]

  {dog: 
    { key: 'sdffsgfdsgfg'    }
  }


get '/api/v2/*' do
  full_api_url = POKE_API_URL + params['splat'].join('')

  if request.env['rack.request.query_string'].empty?
    full_api_url += '?' + request.env['rack.request.query_string']
  end

  req = HTTParty.get(full_api_url)

  cache[full_api_url] ||= fix_api_urls(JSON.parse req.body).to_json
end