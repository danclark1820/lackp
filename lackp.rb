require 'CSV'

lackp = {}
counter = 1
CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
  lackp[("player_" + counter.to_s).to_sym] = {
    first_name: row[0],
    last_name:  row[1],
    position:   row[2],
    team:       row[3]
  }
  counter += 1
end

teams = []
lackp.each do |key, value|
  if !(teams.include?(value[:team]))
    teams<<value[:team]
  end
end
puts teams
