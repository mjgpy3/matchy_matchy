module MatchyMatchy
  NO_BLOCK_GIVEN_ERROR = 'Block must be given to satisfy match'
  REQUIRED_PARAM_ERROR = 'Block must accept matcher as parameter'
  NON_EXHAUSTIVE = 'Non-exhaustive matches'

  def self.match(value, &b)
    fail NO_BLOCK_GIVEN_ERROR unless block_given?
    fail REQUIRED_PARAM_ERROR unless b.arity == 1

    fail NON_EXHAUSTIVE
  end

end
