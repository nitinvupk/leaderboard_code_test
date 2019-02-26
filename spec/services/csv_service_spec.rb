require_relative '../../services/csv_service'
require 'pry'

RSpec.describe CsvService do

  describe 'read csv' do
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

    it 'read file' do
      file = CsvService.call(file_path)
      expect(file).to include(['Jack', 1])
      expect(file).to include(['John', 2])
    end

    it 'file not exist' do
      file_path = nil
      file = CsvService.call(file_path)
      expect(file).to eql(nil)
    end

    # Remove file after cases
    after do
      File.delete(file_path)
    end
  end
end

