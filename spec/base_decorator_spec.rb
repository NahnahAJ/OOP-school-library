require_relative 'spec_helper'

describe BaseDecorator do
  let(:nameable) { double("Nameable") }
  subject { described_class.new(nameable) }

  describe "#correct_name" do
    it "should return the correct name" do
      allow(nameable).to receive(:correct_name).and_return("Mason Specter")
      expect(subject.correct_name).to eql "Mason Specter"
    end
  end
end
