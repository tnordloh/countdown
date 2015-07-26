class Results

  def initialize(first,second)
    @first, @second = [first,second].sort.reverse
    @answers = {}
  end

  attr_accessor :first

  def answers
    @answers.merge! try(@first, :/, @second) unless ( @second == 0 ||
                                   @first % @second != 0 )
    [:*, :+, :-].each do |operator|
      @answers.merge! try(@first, operator , @second )
    end
    @answers
  end

  def try(first,operator,second)
    answer = first.send(operator,second)
    { answer =>
      "#{first} #{operator.to_s} #{second} = #{answer}" }
  end
end
