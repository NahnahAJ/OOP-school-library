require 'spec_helper'

describe Nameable do
  let(:nameable) { double('nameable') }

  describe '#correct_name' do
    it 'raises a NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(RSpec::Mocks::MockExpectationError)
    end
  end
end
