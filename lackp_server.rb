require 'sinatra'
require 'CSV'
require 'pry'

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
  @positions = []
  @lackp.each do |key, value|
    if !(@teams.include?(value[:team]))
      @teams << value[:team]
    end
  end

  @teams.each do |x|
    x.downcase!.gsub!(' ', '_')
  end

  @lackp.each do |key, value|
    if !(@positions.include?(value[:position]))
      @positions << value[:position]
    end
  end

  @positions.each do |x|
    x.downcase!.gsub!(' ', '_')
  end

  erb :index
end

#Took team and positions array and changed format so get '/team_name' can be iterated.
#Need to be able to switch team/position name array back to 'Team Name' to iterate @key assignment

get '/simpson_slammers' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Simpson Slammers"
  erb :teams
end

get '/jetson_jets' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Jetson Jets"
  erb :teams
end

get '/flinestone_fire' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Flinestone Fire"
  erb :teams
end

get '/griffin_goats' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Griffin Goats"
  erb :teams
end

get '/catcher' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Catcher"
  erb :position
end

get '/pitcher' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Pitcher"
  erb :position
end

get '/1st_base' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "1st Base"
  erb :position
end

get '/2nd_base' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "2nd Base"
  erb :position
end

get '/3rd_base' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "3rd Base"
  erb :position
end

get '/shortstop' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Shortstop"
  erb :position
end

get '/right_field' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Right Field"
  erb :position
end

get '/center_field' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Center Field"
  erb :position
end

get '/left_field' do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @key = "Left Field"
  erb :position
end
