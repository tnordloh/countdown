require_relative 'results'
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
      results = Results.new(*args).answers
      if(results[@goal])
        @found = true
        @answer = results[@goal]
        return
      else
        results.each do |key,value|
          create_node(args[0],args[1],key,value)
        end
      end
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

  def create_node(first,second,answer,answer_text)
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
