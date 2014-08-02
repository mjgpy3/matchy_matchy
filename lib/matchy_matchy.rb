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

  def self.anything
    AnythingMatcher.new
  end

  class AnythingMatcher
    def to_s
      '<MatchyMatchy::AnythingMatcher>'
    end
  end

  class MatchMaker

    attr_reader :result

    def initialize(value)
      @match_made = false
      @result = nil
      @to_match = value
    end

    def value(value)
      if !@match_made && (value == @to_match || value.is_a?(AnythingMatcher))
        @result, @match_made = yield, true
      end
      self
    end

    def match_accomplished?
      @match_made
    end

  end

end
