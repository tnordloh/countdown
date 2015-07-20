class CountDown
  POSSIBLE_ARGUMENTS = :divmod,:+,:-,:/,:*
  def initialize(goal, *list,previous: "")
    @goal = goal
    @list = list
    @found = false
    @previous = previous
    @next_level = []
  end

  attr_reader :previous

  def try_all_combinations
    @next_level = []
    @list.combination(2).to_a.each do |args|
      first,second = args.sort.reverse
      try(first, :/, second) unless ( second == 0 ||
                                           first % second != 0 )
      [:*, :+, :-].each do |operator|
        try(first, operator , second )
      end
      return if @found == true
    end
    if @found == false
      @next_level.each do |cd|
        if cd.found?
          @found = true
          @answer = cd.previous + cd.answer
          return true
        end
      end
    end
  end

  def try(first,operator,second)
    answer = first.send(operator,second)
    answer_text = "#{first} #{operator.to_s} #{second} = #{answer}"
    if answer == @goal
      @answer = answer_text
      @found = true
    elsif @list.size > 2
      next_level(first,second,answer,answer_text)
    end
  end

  def next_level(first,second,answer,answer_text)
    list = @list.dup
    list.delete(first)
    list.delete(second)
    list << answer
    @next_level << self.class.new(@goal, *list, previous: answer_text + ",")
  end

  def found?
    try_all_combinations
    @found
  end

  def answer
    if found? == true
      @answer
    else
      nil
    end
  end

end
