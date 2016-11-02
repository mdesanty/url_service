require 'sinatra'
require 'uri'

get '/digital/prime/url_service/get_base_url_from_url_string' do
  url_string = params[:url_string]

  begin
    uri = URI.parse(url_string)
    base_url = "#{uri.scheme}://#{uri.host}#{uri.path}"
  rescue => ex
    halt 422
  end

  return base_url
end