# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_accessor :bonus

  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @first_shot = Shot.new(first_mark)
    @second_shot = Shot.new(second_mark)
    @third_shot = Shot.new(third_mark)
    @bonus = []
  end

  def score
    [@first_shot.score, @second_shot.score, @third_shot.score].sum
  end

  def total_score
    [@first_shot.score, @second_shot.score, @third_shot.score, @bonus.sum].sum
  end

  def strike?
    @first_shot.score == 10
  end

  def spare?
    score == 10 && !strike?
  end
end
