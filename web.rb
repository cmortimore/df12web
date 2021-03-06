require 'sinatra'
require 'net/http'
require 'net/https'
require 'uri'

$client_id = ENV['client_id']
$client_secret = ENV['client_secret']
$redirect_uri = ENV['redirect_uri']

get '/' do
  '<a href="https://login.salesforce.com/services/oauth2/authorize?response_type=code&client_id=' + $client_id + '&client_secret=' + $client_secret + '&redirect_uri=' + $redirect_uri + '">login with salesforce</a>'
end

get '/oauth' do
  code = params[:code]
  unless code.nil?
    http = Net::HTTP.new('login.salesforce.com', 443)
    http.use_ssl = true
    path = '/services/oauth2/token'
    data = 'client_id=' + $client_id + '&client_secret=' + $client_secret + '&redirect_uri=' + $redirect_uri + '&grant_type=authorization_code&code=' + code
    headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
    resp, data = http.post(path, data, headers)
    
    "Token Response:  #{resp.body}"
  end
end


