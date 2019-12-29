# Write your code here!
require 'pry'
def game_hash
  game_hash = {
    :home => {
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
    }
  }
end

def num_points_scored(player_name)
 i = 0
 points = 0
  while i < game_hash[:home][:players].length
  if player_name == game_hash[:home][:players][i][:player_name]
    points = game_hash[:home][:players][i][:points]
  elsif player_name == game_hash[:away][:players][i][:player_name]
    points = game_hash[:away][:players][i][:points]
  else
   points = points
  end
  i += 1
  end
  return points
end

def shoe_size(player_name)
  i = 0
 shoe_size = 0
 
  while i < game_hash[:home][:players].length
  if player_name == game_hash[:home][:players][i][:player_name]
    shoe_size = game_hash[:home][:players][i][:shoe]
  elsif player_name == game_hash[:away][:players][i][:player_name]
    shoe_size = game_hash[:away][:players][i][:shoe]
  else
   shoe_size = shoe_size
  end
  i += 1
  end
  return shoe_size
end

def team_colors(team_name)
  i = 0
 team_colors = []
 
  while i < 2
  if team_name == game_hash[:home][:team_name]
    team_colors = game_hash[:home][:colors]
  elsif team_name == game_hash[:away][:team_name]
    team_colors = game_hash[:away][:colors]
  end
  i += 1
  end
  return team_colors
end

def team_names
  teams = []
  teams.push(game_hash[:home][:team_name])
  teams.push(game_hash[:away][:team_name])
  return teams
end

def player_numbers(team_name)
  brooklyn_numbers = []
  charlotte_numbers = []
  i = 0
  while i < game_hash[:home][:players].length
  if team_name == "Brooklyn Nets"
  brooklyn_numbers.push(game_hash[:home][:players][i][:number])
  elsif team_name == "Charlotte Hornets"
  charlotte_numbers.push(game_hash[:away][:players][i][:number])
  end
  i += 1
end

if brooklyn_numbers.length > charlotte_numbers.length
  return brooklyn_numbers
else
  return charlotte_numbers
  end
end

def player_stats(player_name)
  stats = {}
  i = 0
  while i < game_hash[:home][:players].length
  if player_name == game_hash[:home][:players][i][:player_name]
      stats = game_hash[:home][:players][i]
      stats.delete(:player_name)
  elsif player_name == game_hash[:away][:players][i][:player_name]
  stats = game_hash[:away][:players][i]
  stats.delete(:player_name)
  end
  i += 1
end
return stats
end
  
def big_shoe_rebounds
  biggest_shoe = 0
  i = 0
  
  while i < game_hash[:away][:players].length
  if game_hash[:away][:players][i][:shoe] > biggest_shoe
    biggest_shoe = game_hash[:away][:players][i][:shoe]
  end
  i += 1
end

j = 0
while j < game_hash[:home][:players].length
if game_hash[:home][:players][j][:shoe] > biggest_shoe
  biggest_shoe = game_hash[:home][:players][j][:shoe]
end
j += 1
end

k = 0 
while k < 5
if biggest_shoe == game_hash[:home][:players][k][:shoe]
  return game_hash[:home][:players][k][:rebounds]
  elsif biggest_shoe == game_hash[:away][:players][k][:shoe]
  return game_hash[:away][:players][k][:rebounds]
end
k += 1
end
end

def most_points_scored
  points = 0
  i = 0
  high_scorer = game_hash[:home][:players][0][:player_name]
while i < 5 
  if points < game_hash[:home][:players][i][:points]
    points = game_hash[:home][:players][i][:points]
  elsif points < game_hash[:away][:players][i][:points]
  points = game_hash[:away][:players][i][:points]
  end
i += 1 
end

j = 0 
while j < 5 
  if points == game_hash[:home][:players][j][:points]
  high_scorer = game_hash[:home][:players][j][:player_name]
  elsif points == [:away][:players][j][:points]
  high_scorer = game_hash[:away][:players][j][:player_name]
  end
j += 1 
end
return high_scorer
end