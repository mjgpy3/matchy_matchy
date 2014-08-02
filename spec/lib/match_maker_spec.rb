require './lib/matchy_matchy'

describe MatchyMatchy::MatchMaker do

  describe '#initialize' do

    context 'when initialized with the value it is matching against (i.e. 42)' do
      let(:matcher) { described_class.new(42) }
      subject { matcher }

      it { is_expected.to be_kind_of(described_class) }

      context 'when doing some order-specific matches' do

        context "when the second matches and the first doesn't" do
          let(:match_result) do
            matcher.value(43) { :the_first_result }
            matcher.value(42) { :the_second_result }
          end

          describe '#result' do
            subject { match_result.result }

            it { is_expected.to eq(:the_second_result) }
          end
        end

        context "when neither match" do
          let(:match_result) do
            matcher.value(43) { :the_first_result }
            matcher.value(44) { :the_second_result }
          end

          describe '#match_accomplished?' do
            subject { match_result.match_accomplished? }

            it { is_expected.to be(false) }
          end
        end

        context "when both match" do
          let(:match_result) do
            matcher.value(42) { :the_first_result }
            matcher.value(42) { :the_second_result }
          end

          describe '#result' do
            subject { match_result.result }

            it { is_expected.to eq(:the_first_result) }
          end
        end

        context "when both match and the second is the anything matcher" do
          let(:match_result) do
            matcher.value(42) { :the_first_result }
            matcher.value(anything) { :the_second_result }
          end

          describe '#result' do
            subject { match_result.result }

            it { is_expected.to eq(:the_first_result) }
          end
        end
      end

      describe '#value' do
        let(:matcher_value) { matcher.value(value) { :result } }

        context 'when attempting to match against 68' do
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

        context 'when attempting to match against anything anything' do
          let(:value) { MatchyMatchy::anything }

          describe '#match_accomplished?' do
            subject { matcher_value.match_accomplished? }

            it { is_expected.to be(true) }
          end

          describe '#result' do
            subject { matcher_value.result }

            it { is_expected.to eq(:result) }
          end
        end

        context 'when attempting to match against 42' do
          let(:value) { 42 }

          describe '#match_accomplished?' do
            subject { matcher_value.match_accomplished? }

            it { is_expected.to be(true) }
          end

          describe '#result' do
            subject { matcher_value.result }

            it { is_expected.to eq(:result) }
          end

          context 'and another value is checked that is not 42' do
            before(:each) { matcher.value(68) }

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
end
