module MatchyMatchy
  NO_BLOCK_GIVEN_ERROR = 'Block must be given to satisfy match'
  REQUIRED_PARAM_ERROR = 'Block must accept matcher as parameter'
  NON_EXHAUSTIVE = 'Non-exhaustive matches'

  def self.match(value, &b)
    fail NO_BLOCK_GIVEN_ERROR unless block_given?
    fail REQUIRED_PARAM_ERROR unless b.arity == 1

    result = yield(MatchMaker.new(value))

    fail NON_EXHAUSTIVE if result.nil?

    result
  end

  class MatchMaker

    def initialize(value)
      @to_match = value
      @match_made = false
    end

    def value(value)
      @match_made = true if value == @to_match
      self
    end

    def result
      :result
    end

    def match_accomplished?
      @match_made
    end

  end

end
