require './lib/matchy_matchy'

describe MatchyMatchy::MatchMaker do

  describe '#initialize' do

    context 'when initialized with the value it is matching against (i.e. 42)' do
      let(:matcher) { described_class.new(42) }
      subject { matcher }

      it { is_expected.to be_kind_of(described_class) }

      describe '#value' do
        let(:matcher_value) { matcher.value(value) { :result } }

        context 'when the value is not 42' do
          let(:value) { 68 }

          describe '#match_accomplished?' do
            subject { matcher_value.match_accomplished? }

            it { is_expected.to be(false) }
          end

          describe '#result' do
            subject { matcher_value.result }

            it { is_expected.to eq(nil) }
          end
        end

        context 'when the value is 42' do
          let(:value) { 42 }

          describe '#match_accomplished?' do
            subject { matcher_value.match_accomplished? }

            it { is_expected.to be(true) }
          end

          describe '#result' do
            subject { matcher_value.result }

            it { is_expected.to eq(:result) }
          end
        end
      end
    end
  end
end
