require_relative '../services/csv_service'
require_relative 'data_converter'

require 'pry'

module Scorecard
  module_function

  def read_score(file)
    CsvService.call(file)
  end

  def final_score(file)
    scores = read_score(file)
    DataConverter.sorted_score(scores)
  end

end
