require_relative 'modules/scorecard'

class Leaderboard
  include Scorecard
  attr_reader :file_path

  def initialize(path)
    @file_path = path
  end

  def summary
    final_score = final_score(file_path)

    #  Final out put for show
    if final_score
      final_score.each{|k, v| puts "#{k}: #{v}" }
    else
      puts 'Scorecard not present.'
    end
  end

end

path = ARGV[0]
Leaderboard.new(path).summary
