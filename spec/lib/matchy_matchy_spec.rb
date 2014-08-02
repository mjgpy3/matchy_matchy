require './lib/matchy_matchy'

describe MatchyMatchy do

  describe '.match' do

    context 'when given a value but no block' do
      subject { described_class.match(42) }

      specify { expect { subject }.to raise_error('Block must be given to satisfy match') }
    end

  end

end
