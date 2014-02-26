require 'sinatra'
require 'CSV'

def csv_to_hash(file_name)
  lackp = {}
  counter = 1
  CSV.foreach(file_name, headers: true) do |row|
    lackp[("player_" + counter.to_s).to_sym] = {
      first_name: row[0],
      last_name:  row[1],
      position:   row[2],
      team:       row[3]
    }
    counter += 1
  end
  lackp
end



set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @teams = []
  @lackp.each do |key, value|
    if !(@teams.include?(value[:team]))
      @teams<<value[:team]
    end
  end
  erb :index
end

get '/simpson_slammers' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  erb :simpson_slammers
end

get '/jetson_jets' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  erb :jetson_jets
end

get '/flinestone_fire' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  erb :flinestone_fire
end

get '/griffin_goats' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  erb :griffin_goats
end
