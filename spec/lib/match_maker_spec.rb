require './lib/matchy_matchy'

describe MatchyMatchy::MatchMaker do

  describe '#initialize' do

    context 'when initialized with the value it is matching against (i.e. 42)' do
      let(:matcher) { described_class.new(42) }
      subject { matcher }

      it { is_expected.to be_kind_of(described_class) }

      context 'when doing some order-specific, value matches' do

        [
          [43, 42, 2],
          [42, 42, 1],
          [42, MatchyMatchy.anything, 1]
        ].each do |first, second, winner|
          context "for example: value #{first}, then #{second}" do
            let(:match_result) do
              matcher.value(first) { :the_first_result }
              matcher.value(second) { :the_second_result }
            end

            describe '#result' do
              subject { match_result.result }

              it { is_expected.to eq(winner == 1 ? :the_first_result : :the_second_result) }
            end
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
