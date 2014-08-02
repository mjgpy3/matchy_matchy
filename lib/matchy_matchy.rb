module MatchyMatchy
  NO_BLOCK_GIVEN_ERROR = 'Block must be given to satisfy match'

  def self.match(value)
    fail NO_BLOCK_GIVEN_ERROR unless block_given?
  end

end
