require 'sinatra'

$client_id = ENV['client_id']
$client_secret = ENV['client_secret']
$redirect_uri = ENV['redirect_uri']

get '/' do
  "<a href='https://login.salesforce.com/services/oauth2/authorize?response_type=code&client_id=3MVG99OxTyEMCQ3gNp2PjkqeZKwQqMOOxLzAKtPhEwpD.HEMVGcw9sLXfYOmLG3U_G_JOxd6MbpwmMmj0VDQj&client_secret=930847565453470131&redirect_uri=https%3A%2F%2Fdf12web.herokuapp.com%2Foauth'>login with salesforce</a>"
end

get '/auth' do
  code = params[:code]
  if code == nil
    ""
  elsif
    puts code
  end

end

