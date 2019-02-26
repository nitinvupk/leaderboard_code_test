module DataConverter
  module_function

  def sorted_score(scores)
    convert(scores).sort_by{|key, value| value}.reverse if scores
  end

  def convert(scores)
    scores.each_with_object(Hash.new(0)){ |(k,v), h | h[k] += v } if scores
  end

end
