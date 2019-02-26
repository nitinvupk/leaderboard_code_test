require_relative '../leaderboard'

RSpec.describe Leaderboard do

  describe 'summary' do
    let(:file_path) { 'spec/input_file.csv' }

    # Generate csv for test
    before do
      CSV.open(file_path, 'w') do |csv|
        csv << ['Jack', '1']
        csv << ['John', '2']
        csv << ['David', '1']
        csv << ['Jack', '-1']
      end
    end

    it 'scorecard summary' do
      scores = Leaderboard.new(file_path)
      expect(scores.summary).to include(['John', 2])
      expect(scores.summary).to include(['Jack', 0])
      expect(scores.summary).to include(['David', 1])
    end

    it 'scorecard summary not present' do
      file_path = nil
      scores = Leaderboard.new(file_path)
      expect(scores.summary).to eql(nil)
    end

    after do
      File.delete(file_path)
    end
  end
end

