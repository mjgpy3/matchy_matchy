require './lib/matchy_matchy'

describe MatchyMatchy::MatchMaker do

  describe '#initialize' do

    context 'when initialized with the value it is matching against (i.e. 42)' do
      subject { described_class.new(42) }

      it { is_expected.to be_kind_of(described_class) }
    end

  end

end
