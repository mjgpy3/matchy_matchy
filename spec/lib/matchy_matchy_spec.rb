require './lib/matchy_matchy'

describe MatchyMatchy do

  describe '.match' do

    context 'when given a value of 42' do

      context 'but no block' do
        subject { described_class.match(42) }

        specify { expect { subject }.to raise_error('Block must be given to satisfy match') }
      end

      context 'and a block that does not accept parameters' do
        subject { described_class.match(42) { } }

        specify { expect { subject }.to raise_error('Block must accept matcher as parameter') }
      end

      context 'and a block that has the correct arity but does not satisfy the match' do
        subject { described_class.match(42) { |on| } }

        specify { expect { subject }.to raise_error('Non-exhaustive matches') }
      end

      describe 'the entity it yields' do
        specify do
          described_class.match(42) do |on|
            on.value(42) { :dummy }
            expect(on).to be_kind_of(described_class::MatchMaker)
          end
        end
      end
    end
  end
end
