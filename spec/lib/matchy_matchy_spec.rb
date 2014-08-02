require './lib/matchy_matchy'

describe MatchyMatchy do

  describe '.match' do

    context 'when given a value but no block' do
      subject { described_class.match(42) }

      specify { expect { subject }.to raise_error('Block must be given to satisfy match') }
    end

    context 'when given a value and a block that does not accept parameters' do
      subject { described_class.match(42) { } }

      specify { expect { subject }.to raise_error('Block must accept matcher as parameter') }
    end

  end

end
