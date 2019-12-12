def game_hash()
  hash = {
    home:{
        team_name:"Brooklyn Nets",
        colors:["Black","White"],
        players:[
            {
            :player_name  => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1,
            },
            {
            :player_name  => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
            },
            {
            :player_name  => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
            },
            {
            :player_name  => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
            },
            {
            :player_name  => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
            }
        ]
    },
    away:{
        team_name:"Charlotte Hornets",
        colors:["Turquoise", "Purple"],
        players:[
            {
            :player_name  => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
            },
            {
            :player_name  => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
            },
            {
            :player_name  => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
            },
            {
            :player_name  => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
            },
            {
            :player_name  => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
            }

        ]
    }
}
  return hash
end

def num_points_scored(player_input)
    statement = 0 
    if statement == 0 
        # game_hash[:home][:players].include?({:player_name => player_input)
            game_hash[:home][:players].each do |player| 
                if player[:player_name].include?(player_input) 
                    statement = player[:points] 
                end
            end
        if statement == 0 
            # game_hash[:away][:players].include?({:player_name => player_input)
                game_hash[:away][:players].each do |player| 
                    if player[:player_name].include?(player_input) 
                        statement = player[:points]
                    end
                end
            end
        end
      p statement
end

def shoe_size(player_input)
      statement = 0 
    if statement == 0 
        # game_hash[:home][:players].include?({:player_name => player_input)
            game_hash[:home][:players].each do |player| 
                if player[:player_name].include?(player_input) 
                    statement = player[:shoe] 
                end
            end
        if statement == 0 
            # game_hash[:away][:players].include?({:player_name => player_input)
                game_hash[:away][:players].each do |player| 
                    if player[:player_name].include?(player_input) 
                        statement = player[:shoe]
                    end
                end
            end
        end
      p statement
end

def team_colors(team_name)
    if game_hash[:home][:team_name] == team_name
        return game_hash[:home][:colors]
    else
        return game_hash[:away][:colors]
    end
end


def team_names()
  array = []
  array << game_hash[:home][:team_name]
  array << game_hash[:away][:team_name]
  return array 
end

def player_numbers(input)
    # using the input of a team name, collect that team's player's numbers into an array, sort it, and return it. 
    array = [] 
    if game_hash[:home][:team_name] == input 
        game_hash[:home][:players].each do |players|
            array << players[:number]
        end

    else 
        game_hash[:away][:players].each do |players|
        array << players[:number]
        end
    end
    array.sort!
    p array 
    return array 
end

def player_stats(input)
    hash = {}
    statement = 0 
  if statement == 0 
          game_hash[:home][:players].each do |player| 
              if player[:player_name].include?(input) 
                  hash[:assists] = player[:assists]
                  hash[:blocks] = player[:blocks] 
                  hash[:number] = player[:number]
                  hash[:points] = player[:points]
                  hash[:rebounds] = player[:rebounds]
                  hash[:shoe] = player[:shoe]
                  hash[:slam_dunks] = player[:slam_dunks]
                  hash[:steals] = player[:steals]
                statement = 1 
                  #   expected: {:assists=>1, :blocks=>7, :number=>4, :points=>10, :rebounds=>1, :shoe=>18, :slam_dunks=>2, :steals=>2}
              end
          end
      if statement == 0 
          # game_hash[:away][:players].include?({:player_name => player_input)
              game_hash[:away][:players].each do |player| 
                  if player[:player_name].include?(input) 
                    hash[:assists] = player[:assists]
                    hash[:blocks] = player[:blocks] 
                    hash[:number] = player[:number]
                    hash[:points] = player[:points]
                    hash[:rebounds] = player[:rebounds]
                    hash[:shoe] = player[:shoe]
                    hash[:slam_dunks] = player[:slam_dunks]
                    hash[:steals] = player[:steals]
                    statement = 1 
                  
                  end
              end
          end
      end
    pp hash 
end

def big_shoe_rebounds 
    biggest_shoe_size_rebounds = 0 
    biggest_home_shoe_size = game_hash[:home][:players].sort_by{|k| k[:shoe]}.last
    biggest_away_shoe_size = game_hash[:away][:players].sort_by{|k| k[:shoe]}.last

    if biggest_home_shoe_size[:shoe] >  biggest_away_shoe_size[:shoe]
        biggest_shoe_size_rebounds = biggest_home_shoe_size[:rebounds]
    else
        biggest_shoe_size_rebounds = biggest_away_shoe_size[:rebounds]
    end
    return biggest_shoe_size_rebounds
end

def most_points_scored 
    most_points_name = 0 
    most_points_home = game_hash[:home][:players].sort_by{|k| k[:points]}.last
    most_points_away = game_hash[:away][:players].sort_by{|k| k[:points]}.last

    if most_points_home[:points] >  most_points_away[:points]
        most_points_name = most_points_home[:player_name]
    else
        most_points_name = most_points_away[:player_name]
    end
    return most_points_name
end

def winning_team 
    winning_team_name = 0 
    home_team_score = 0 
    away_team_score = 0 
    game_hash[:home][:players].each do |key,value|
        home_team_score += key[:points]
    end 
    game_hash[:away][:players].each do |key,value|
        away_team_score += key[:points]
    end 
    
    if home_team_score > away_team_score 
        winning_team_name = game_hash[:home][:team_name]
    else
        winning_team_name = game_hash[:away][:team_name]
    end
    return winning_team_name
end

def player_with_longest_name 
    longest_name = 0 
    longest_name_home = game_hash[:home][:players].sort_by{|k| k[:player_name].length}.last
    longest_name_away = game_hash[:away][:players].sort_by{|k| k[:player_name].length}.last

    # pp longest_name_home
    # pp longest_name_away
    if longest_name_home[:player_name].length >  longest_name_away[:player_name].length
        longest_name = longest_name_home[:player_name]
    else
        longest_name = longest_name_away[:player_name]
    end
    return longest_name
end

def most_steals
    most_steals_name = 0 
    most_steals_home = game_hash[:home][:players].sort_by{|k| k[:steals]}.last
    most_steals_away = game_hash[:away][:players].sort_by{|k| k[:steals]}.last

    if most_steals_home[:steals] >  most_steals_away[:steals]
        most_steals_name = most_steals_home[:player_name]
    else
        most_steals_name = most_steals_away[:player_name]
    end
    return most_steals_name
end

def long_name_steals_a_ton?
 longest_name = player_with_longest_name() 
 most_steals_name = most_steals() 
 if longest_name == most_steals_name 
    
    return true 
 else return false 
 end 
end