require 'csv'

module CsvService
  module_function

  def call(path)
    file = File.read(path) if path
    CSV.parse(file, converters: :numeric) if file
  end
end
