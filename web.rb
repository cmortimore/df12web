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
    #http = Net::HTTP.new('login.salesforce.com', 443)
    #http.use_ssl = true
    #path = '/services/oauth2/token'
    http = Net::HTTP.new('requestb.in', 80)
    path = 'oje8usoj'
    data = 'serwis=wp.pl&url=profil.html&tryLogin=1&countTest=1&logowaniessl=1&login_username=blah&login_password=blah'
    headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
    resp, data = http.post(path, data, headers)
    
    
    #request.set_form_data({"client_id" => $client_id, "client_secret" => $client_secret, "redirect_uri" => $redirect_uri, "grant_type" => "authorization_code", "code" => code})
    #headers = {'Content-Type'=> 'application/x-www-form-urlencoded'}
    #response = http.request(request)
    
    
    #data = 'client_id=' + $client_id + '&client_secret=' + $client_secret + '&redirect_uri=' + $redirect_uri + '&grant_type=authorization_code&code=' + code
    #headers = {'Content-Type'=> 'application/x-www-form-urlencoded'}
    #resp, data = http.post(path, data, headers)
    "Token Reponse: #{resp}"
  end
end


