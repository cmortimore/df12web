require 'sinatra'
require 'net/http'
require 'net/https'
require 'uri'

$client_id = ENV['client_id']
$client_secret = ENV['client_secret']
$redirect_uri = ENV['redirect_uri']

get '/' do
  "<a href='https://login.salesforce.com/services/oauth2/authorize?response_type=code&client_id=" + $client_id + "&client_secret=" + $client_secret + "&redirect_uri=" + $redirect_uri + "'>login with salesforce</a>"
end

get '/oauth' do
  code = params[:code]
  unless code.nil?
    "Code #{code}!"
  end
end

