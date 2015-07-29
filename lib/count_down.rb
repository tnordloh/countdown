require_relative 'results'
class CountDown
  POSSIBLE_ARGUMENTS = :divmod,:+,:-,:/,:*
  def initialize(goal, *list,previous: "")
    @goal = goal
    @list = list
    @previous = previous
  end

  attr_reader :previous

  def try_all_combinations
    child_nodes = []
    @list.combination(2).to_a.each do |args|
      results = Results.new(*args).answers
      if(results[@goal])
        @answer = results[@goal]
        return true
      else
        create_children(args[0],args[1],results)
            .inject(child_nodes,:<<)
      end
    end
    try_next_level(child_nodes)
  end

  def create_children(first,second,results)
    results.each_with_object([]) do |(key, value), child_nodes| 
      child_nodes << [create_node(first, second, key, value)]
    end.flatten
  end

  def try_next_level(child_nodes)
    child_nodes.each do |cd|
      if cd.found?
        @answer = cd.previous + cd.answer
        return true
      end
    end
    return false
  end

  def create_node(first,second,answer,answer_text)
    list = @list.dup
    list.delete(first)
    list.delete(second)
    list << answer
    self.class.new(@goal, *list, previous: answer_text + ",")
  end

  def found?
    try_all_combinations
  end

  def answer
    if found? == true
      @answer
    else
      nil
    end
  end

end
