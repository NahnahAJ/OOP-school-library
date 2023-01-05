require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(24, "Nicholas")
  end
  describe "#initialize" do
    it 'creates a new Person instance' do
      expect(@person).to be_an_instance_of(Person)
    end
  end

  describe "#age" do
    it "expects age to return a number" do
      expect(@person.age).to eql 24
    end
  end

  describe "#name" do
    it "expects name to return a string" do
      expect(@person.name).to eql "Nicholas"
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(@person.can_use_services?).to eq(true)
    end

    it 'returns true if the person has parent permission' do
      @person.age = 15
      expect(@person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is not of age and does not have parent permission' do
      @person.age = 15
      @person.parent_permission = false
      expect(@person.can_use_services?).to eql false
    end
  end

  describe '#correct_name' do
    it 'returns the name attribute' do
      expect(@person.correct_name).to eq("Nicholas")
    end
  end

  describe '#add_rental' do
  let(:book) { double('book', rentals: []) }
  let(:date) { double('date') }
    it "creates an instance of Rental" do
      expect(@person.add_rental(book, date)).to be_an_instance_of(Rental)
    end
  end
end