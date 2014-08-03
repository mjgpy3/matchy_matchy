module MatchyMatchy
  NO_BLOCK_GIVEN_ERROR = 'Block must be given to satisfy match'
  REQUIRED_PARAM_ERROR = 'Block must accept matcher as parameter'
  NON_EXHAUSTIVE = 'Non-exhaustive matches'

  def self.match(value, &b)
    fail NO_BLOCK_GIVEN_ERROR unless block_given?
    fail REQUIRED_PARAM_ERROR unless b.arity == 1

    matcher = MatchMaker.new(value)
    yield(matcher)

    fail NON_EXHAUSTIVE unless matcher.match_accomplished?

    matcher.result
  end

  class MatchMaker

    attr_reader :result

    def initialize(value)
      @match_made = false
      @result = nil
      @to_match = value
    end

    def kind(kind, &b)
      attempt_match(kind, @to_match.class, &b)
      self
    end

    def value(value, &b)
      attempt_match(value, @to_match, &b)
      self
    end

    def anything(&b)
      make_match(&b)
      self
    end

    def match_accomplished?
      @match_made
    end

    private

    def attempt_match(value, to_match, &b)
      make_match(&b) if new_match?(value, to_match)
    end

    def make_match
      @result, @match_made = yield, true
    end

    def new_match?(value, to_match)
      !@match_made && value == to_match
    end

  end

end
