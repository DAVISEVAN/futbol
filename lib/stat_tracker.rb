require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'game_team'

class StatTracker
    attr_reader :games, :teams, :game_teams

    def self.from_csv(locations)
      games = parse_csv(locations[:games], Game)
      teams = parse_csv(locations[:teams], Team)
      game_teams = parse_csv(locations[:game_teams], GameTeam)
  
      new(games, teams, game_teams)
    end

    def self.parse_csv(filepath, class_object)
      CSV.read(filepath, headers: true, header_converters: :symbol).map do |data|
        class_object.new(data)
      end
    end

    def initialize(games, teams, game_teams)
        @games = games
        @teams = teams
        @game_teams = game_teams
    end

    # Game Statistics
  def highest_total_score
    @games.map { |game| game.away_goals + game.home_goals }.max
  end

  def count_of_teams
    @teams.size
  end

  def best_offense
    goals_by_team = {}
    total_num_of_games_by_team = {};

    @games.each do |game|
      away_team_id = game.away_team_id
      home_team_id = game.home_team_id

      goals_by_team[away_team_id] ||= 0;
      goals_by_team[away_team_id] += game.away_goals;


      goals_by_team[home_team_id] ||= 0;
      goals_by_team[home_team_id] += game.home_goals;

    total_num_of_games_by_team[away_team_id] ||= 0;
    total_num_of_games_by_team[home_team_id] ||= 0;

    total_num_of_games_by_team[home_team_id] += 1;
    total_num_of_games_by_team[away_team_id] += 1;

    end
   team_ids = goals_by_team.keys;
   highest_average = 0
   team_with_highest_average = nil

   team_ids.each do |team_id|
    num_of_games = total_num_of_games_by_team[team_id]
    num_of_goals = goals_by_team[team_id];
    average = num_of_goals.to_f/num_of_games.to_f

    if average > highest_average
      highest_average = average
      team_with_highest_average = team_id
    end

  end
  team_with_highest_average
  
  end
  def worst_offense
    goals_by_team = {}
    total_num_of_games_by_team = {};

    @games.each do |game|
      away_team_id = game.away_team_id
      home_team_id = game.home_team_id

      goals_by_team[away_team_id] ||= 0;
      goals_by_team[away_team_id] += game.away_goals;


      goals_by_team[home_team_id] ||= 0;
      goals_by_team[home_team_id] += game.home_goals;

    total_num_of_games_by_team[away_team_id] ||= 0;
    total_num_of_games_by_team[home_team_id] ||= 0;

    total_num_of_games_by_team[home_team_id] += 1;
    total_num_of_games_by_team[away_team_id] += 1;
    end
   team_ids = goals_by_team.keys;
   lowest_average = 99999999
   team_with_lowest_average = nil

   team_ids.each do |team_id|
    num_of_games = total_num_of_games_by_team[team_id]
    num_of_goals = goals_by_team[team_id];
    average = num_of_goals.to_f/num_of_games.to_f

    if average < lowest_average
      lowest_average = average
      team_with_lowest_average = team_id
    end

  end
  team_with_lowest_average
  
  end

def highest_scoring_visitor

  away_goals_by_team = {}
  total_num_of_away_games_by_team = {};

  @games.each do |game|
    away_team_id = game.away_team_id
    away_goals_by_team[away_team_id] ||= 0;
    away_goals_by_team[away_team_id] += game.away_goals;


    total_num_of_away_games_by_team[away_team_id] ||= 0;
    total_num_of_away_games_by_team[away_team_id] += 1;

  end
  team_ids = away_goals_by_team.keys

  highest_score = 0;
  highest_visitor = nil;

  team_ids.each do |team_id|
    goals = away_goals_by_team[team_id]
    if goals > highest_score
      highest_score = goals
      highest_visitor = team_id
    end

  end

  highest_visitor

end

def lowest_scoring_visitor

  away_goals_by_team = {}
  total_num_of_away_games_by_team = {};

  @games.each do |game|
    away_team_id = game.away_team_id
    away_goals_by_team[away_team_id] ||= 0;
    away_goals_by_team[away_team_id] += game.away_goals;


    total_num_of_away_games_by_team[away_team_id] ||= 0;
    total_num_of_away_games_by_team[away_team_id] += 1;

  end
  team_ids = away_goals_by_team.keys

  lowest_score = 9999; # Change this to a hight number (infinity)
  lowest_visitor = nil;

  team_ids.each do |team_id|
    goals = away_goals_by_team[team_id]
    if goals < lowest_score
      lowest_score = goals
      lowest_visitor = team_id
    end

  end

  lowest_visitor

end


def lowest_scoring_home_team

  home_goals_by_team = {}
  total_num_of_home_games_by_team = {};

  @games.each do |game|
    home_team_id = game.home_team_id
    home_goals_by_team[home_team_id] ||= 0;
    home_goals_by_team[home_team_id] += game.home_goals;


    total_num_of_home_games_by_team[home_team_id] ||= 0;
    total_num_of_home_games_by_team[home_team_id] += 1;


  # League Statistics
  def count_of_teams
    #  implementation here
    return @teams.count

  end
  team_ids = home_goals_by_team.keys

  lowest_score = 9999; # Change this to a hight number (infinity)
  lowest_home = nil;

  team_ids.each do |team_id|
    goals = home_goals_by_team[team_id]
    if goals < lowest_score
      lowest_score = goals
      lowest_home = team_id
    end


  def best_offense
    #  implementation here

    @games.each do |game|
      binding.pry
    end

  end

  lowest_home

end

def highest_scoring_home_team

  home_goals_by_team = {}
  total_num_of_home_games_by_team = {};

  @games.each do |game|
    home_team_id = game.home_team_id
    home_goals_by_team[home_team_id] ||= 0;
    home_goals_by_team[home_team_id] += game.home_goals;


    total_num_of_home_games_by_team[home_team_id] ||= 0;
    total_num_of_home_games_by_team[home_team_id] += 1;

  end

  team_ids = home_goals_by_team.keys

  highest_score = 0; # Change this to a hight number (infiinity)
  highest_home = nil;

  team_ids.each do |team_id|
    goals = home_goals_by_team[team_id]
    if goals > highest_score
      highest_score = goals
      highest_home = team_id
    end

  end

  highest_home
end

  def lowest_total_score
    @games.map { |game| game.away_goals + game.home_goals }.min
  end

  def percentage_home_wins
    total_games = @games.size
    home_wins = @games.count { |game| game.home_goals > game.away_goals }
    (home_wins.to_f / total_games).round(2)
  end

  def percentage_visitor_wins
    total_games = @games.size
    visitor_wins = @games.count { |game| game.away_goals > game.home_goals }
    (visitor_wins.to_f / total_games).round(2)
  end

  def percentage_ties
    total_games = @games.size
    ties = @games.count { |game| game.away_goals == game.home_goals }
    (ties.to_f / total_games).round(2)
  end

  def count_of_games_by_season
    @games.group_by { |game| game.season }.transform_values(&:count)
  end

  def average_goals_per_game
    total_goals = @games.sum { |game| game.away_goals + game.home_goals }
    (total_goals.to_f / @games.size).round(2)
  end

  def average_goals_by_season
    season_goals = @games.group_by { |game| game.season }
    season_goals.transform_values do |games|
      total_goals = games.sum { |game| game.away_goals + game.home_goals }
      (total_goals.to_f / games.size).round(2)
    end
  end


  # Season Statistics
  def winningest_coach(season)
    season_games = @game_teams.select { |gt| @games.any? { |game| game.game_id == gt.game_id && game.season == season } }
    coach_wins = season_games.group_by(&:head_coach).transform_values do |games|
      total_games = games.size
      wins = games.count { |game| game.result == "WIN" }
      (wins.to_f / total_games).round(2)
    end
    coach_wins.max_by { |_, win_percentage| win_percentage }&.first
  end
  def worst_coach(season)
    season_games = @game_teams.select { |gt| @games.any? { |game| game.game_id == gt.game_id && game.season == season } }
    coach_wins = season_games.group_by(&:head_coach).transform_values do |games|
      total_games = games.size
      wins = games.count { |game| game.result == "WIN" }
      (wins.to_f / total_games).round(2)
    end
    coach_wins.min_by { |_, win_percentage| win_percentage }&.first
  end
  def most_accurate_team(season)
    team_shots_to_goals = Hash.new { |hash, key| hash[key] = { shots: 0, goals: 0 } }
    @game_teams.each do |game_team|
      game = @games.find { |g| g.game_id == game_team.game_id }
      if game && game.season == season
        team_shots_to_goals[game_team.team_id][:shots] += game_team.shots
        team_shots_to_goals[game_team.team_id][:goals] += game_team.goals
      end
    end
    team_shots_to_goals.each do |team_id, stats|
      accuracy = stats[:goals].to_f / stats[:shots]
      puts "Team ID: #{team_id}, Accuracy: #{accuracy}, Shots: #{stats[:shots]}, Goals: #{stats[:goals]}"
    end
    best_team_id = team_shots_to_goals.max_by { |team_id, stats| stats[:goals].to_f / stats[:shots] }.first
    team_name = @teams.find { |team| team.team_id == best_team_id }.teamName
    puts "Most Accurate Team ID: #{best_team_id}, Name: #{team_name}"
    team_name
  end
  def least_accurate_team(season)
    team_shots_to_goals = Hash.new { |hash, key| hash[key] = { shots: 0, goals: 0 } }
    @game_teams.each do |game_team|
      game = @games.find { |g| g.game_id == game_team.game_id }
      if game && game.season == season
        team_shots_to_goals[game_team.team_id][:shots] += game_team.shots
        team_shots_to_goals[game_team.team_id][:goals] += game_team.goals
      end
    end
    team_shots_to_goals.each do |team_id, stats|
      accuracy = stats[:goals].to_f / stats[:shots]
      puts "Team ID: #{team_id}, Accuracy: #{accuracy}, Shots: #{stats[:shots]}, Goals: #{stats[:goals]}"
    end
    worst_team_id = team_shots_to_goals.min_by { |team_id, stats| stats[:goals].to_f / stats[:shots] }.first
    team_name = @teams.find { |team| team.team_id == worst_team_id }.teamName
    puts "Least Accurate Team ID: #{worst_team_id}, Name: #{team_name}"
    team_name
  end
  def most_tackles(season)
  season_games = @game_teams.select { |gt| @games.any? { |game| game.game_id == gt.game_id && game.season == season } }
  team_tackles = season_games.group_by(&:team_id).transform_values do |games|
    total_tackles = games.sum(&:tackles)
  end
  best_team_id = team_tackles.max_by { |_, tackles| tackles }&.first
  team_name = @teams.find { |team| team.team_id == best_team_id }&.teamName
  puts "Most Tackles Team ID: #{best_team_id}, Name: #{team_name}"
  team_name
  end
  def fewest_tackles(season)
    season_games = @game_teams.select { |gt| @games.any? { |game| game.game_id == gt.game_id && game.season == season } }
    team_tackles = season_games.group_by(&:team_id).transform_values do |games|
      total_tackles = games.sum(&:tackles)
    end
    worst_team_id = team_tackles.min_by { |_, tackles| tackles }&.first
    team_name = @teams.find { |team| team.team_id == worst_team_id }&.teamName
    puts "Fewest Tackles Team ID: #{worst_team_id}, Name: #{team_name}"
    team_name
  end
end
