# Write your code here!
def game_hash
  result = {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
      {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
      {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
      {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
      {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
        ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
      {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10},
      {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
      {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
      {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12},
      ]
  }}
  result
end

def num_points_scored(name)
  stats = game_hash
  result = nil
  stats[:home][:players].each do |i|
    if i[:player_name] == name
      result = i[:points]
    end
  end
  stats[:away][:players].each do |i|
    if i[:player_name] == name
      result = i[:points]
    end
  end
  return result
end

def player_lookup(name)
  result = nil
  stats = game_hash
  stats[:home][:players].each do |i|
    if i[:player_name] == name
      result = i
    end
  end
  stats[:away][:players].each do |i|
    if i[:player_name] == name
      result = i
    end
  end
  return result
end

def shoe_size(name)
  result = nil
  stats = player_lookup(name)
  result = stats[:shoe]
end

def team_colors(name)
  result = nil
  stats = game_hash
  if stats[:home][:team_name] == name
    result = stats[:home][:colors]
  elsif stats[:away][:team_name] == name
    result = stats[:away][:colors]
  end
  return result
end

def team_names
  result = []
  stats = game_hash
  result = [stats[:home][:team_name], stats[:away][:team_name]]
end

def player_numbers(name)
   result = []
  stats = game_hash
  if stats[:home][:team_name] == name
    stats[:home][:players].each do |i|
      result.push(i[:number])
    end
  elsif stats[:away][:team_name] == name
    stats[:away][:players].each do |i|
      result.push(i[:number])
    end
  end
  return result
end

def player_stats(name)
  result = nil
  stats = player_lookup(name)
  stats.delete(:player_name)
  return stats
end

def big_shoe_rebounds
  result = 0 
  stats = game_hash
  x = stats[:home][:players][0]
  stats[:home][:players].each do |i|
    if i[:shoe] > x[:shoe]
      x = i
    end
  end
  stats[:away][:players].each do |i|
    if i[:shoe] > x[:shoe]
      x = i
    end
  end
  result = x[:rebounds]
  return result
end

def most_points_scored
  result = 0 
  stats = game_hash
  x = stats[:home][:players][0]
  stats[:home][:players].each do |i|
    if i[:points] > x[:points]
      x = i
    end
  end
  stats[:away][:players].each do |i|
    if i[:points] > x[:points]
      x = i
    end
  end
  result = x[:player_name]
  return result
end

def winning_team
  home_score = 0 
  away_score = 0 
  stats = game_hash
  stats[:home][:players].each do |i|
    home_score += i[:points]
  end
  stats[:away][:players].each do |i|
    away_score += i[:points]
  end
  if home_score > away_score
    result = stats[:home][:team_name]
  elsif away_score > home_score
    result = stats[:away][:team_name]
  else
    result = "Tie"
  end
  return result
end

def player_with_longest_name
  result = "" 
  stats = game_hash
  x = stats[:home][:players][0]
  stats[:home][:players].each do |i|
    if i[:player_name].length > x[:player_name].length
      x = i
    end
  end
  stats[:away][:players].each do |i|
    if i[:player_name].length > x[:player_name].length
      x = i
    end
  end
  result = x[:player_name]
end

def long_name_steals_a_ton?
  stats = game_hash
  x = stats[:home][:players][0]
  stats[:home][:players].each do |i|
    if i[:steals] > x[:steals]
      x = i
    end
  end
  stats[:away][:players].each do |i|
    if i[:steals] > x[:steals]
      x = i
    end
  end
  player = player_lookup(player_with_longest_name)
  if player[:steals] == x[:steals]
    return true 
  else
    return false 
  end
end