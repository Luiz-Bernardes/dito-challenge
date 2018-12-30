class PointsController < ApplicationController
  def index
    points = Point.all
    @points = TimerDecorator.wrap(points)
  end
end
