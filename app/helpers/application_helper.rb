module ApplicationHelper
  def calc_points user
    sum_points = 0
    max_points = 3126
    points = Point.where(user_id: user.id)
    points.each { |point| sum_points += point.score } 
    sum_points = max_points if sum_points > max_points
    return sum_points
  end
end
