require 'sinatra'
require 'CSV'
require 'pry'
require 'shotgun'

def csv_to_hash(file_name)
  lackp = {}
  counter = 1
  CSV.foreach(file_name, headers: true) do |row|
    lackp[("player_" + counter.to_s).to_sym] = {
      first_name: row[0],
      last_name:  row[1],
      position:   row[2],
      team:       row[3],
      #team_url: row[3].downcase.gsub(' ', '_')
    }
    counter += 1
  end
  lackp
end


set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
end

before do
  @lackp = csv_to_hash('lackp_starting_rosters.csv')
  @unique_teams = []
  @lackp.each do |key, value|
    if !(@unique_teams.include?(value[:team]))
      @unique_teams << value[:team]
    end
  end

  @unique_positions = []
  @lackp.each do |key, value|
    if !(@unique_positions.include?(value[:position]))
      @unique_positions << value[:position]
    end
  end
end

get "/:team_name" do
  erb :teams
end

get "/position/:position_name" do
  erb :position
end


