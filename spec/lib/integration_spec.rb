require './lib/matchy_matchy.rb'

describe MatchyMatchy do

  describe '(integration tests, exhaustive patterns)' do

    context 'matching 42, using 41, 43, then 42' do

      subject do
        described_class.match(42) do |on|
          on.value(41) { :first }
          on.value(43) { :second }
          on.value(42) { :third }
        end
      end

      it { is_expected.to be(:third) }
    end

    context 'matching 42, using 41, 43, then anything' do

      subject do
        described_class.match(42) do |on|
          on.value(41) { :first }
          on.value(43) { :second }
          on.anything { :third }
        end
      end

      it { is_expected.to be(:third) }
    end

    context 'matching 42, using kind(String), kind(Fixnum), then anything' do

      subject do
        described_class.match(42) do |on|
          on.kind(String) { :first }
          on.kind(Fixnum) { :second }
          on.anything { :third }
        end
      end

      it { is_expected.to be(:second) }
    end

    context 'FizzBuzz (for the fun of it)' do
      {
        1 => '1',
        2 => '2',
        3 => 'Fizz',
        5 => 'Buzz',
        15 => 'FizzBuzz'
      }.each do |value, expected_string|
        it "should return '#{expected_string}' for #{value}" do
          div_by_3 = value%3 == 0
          div_by_5 = value%5 == 0
          expect(described_class.match([div_by_3, div_by_5]) { |on|
            on.value([true, false]) { 'Fizz' }
            on.value([false, true]) { 'Buzz' }
            on.value([true, true]) { 'FizzBuzz' }
            on.anything { value.to_s }
          }).to eq(expected_string)
        end
      end
    end
  end
end
