require_relative 'spec_helper'

describe CapitalizeDecorator do
  let(:nameable) { double('nameable', correct_name: 'john') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the output of the correct_name method of the decorated object' do
      expect(decorator.correct_name).to eq('John')
    end
  end
end
