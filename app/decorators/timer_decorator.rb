class TimerDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def formatted_date
    score_date.strftime("%d/%m/%Y")
  end

  def formatted_datetime
    created_at.strftime("%d/%m/%Y - %H:%M")
  end
end