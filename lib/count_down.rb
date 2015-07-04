class CoutDown
  def initialize(goal, list*)
    @goal = goal
    @list = list

  end

  def answer
    "#{list[0]} * #{list[1]} = @goal"
  end
end
