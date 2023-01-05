require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new("Title", "Author")
  end

  describe "#new" do
    it "when two parameters are provided and the book is created" do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe "#title" do
    it "expects the title of the book to be the same" do
      expect(@book.title).to eql "Title"
    end
  end

  describe "#author" do
    it "expects the author of the book to be the same" do
      expect(@book.author).to eql "Author"
    end
  end

  describe "#add_rental" do
  let(:person) { double('person', rentals:[]) }
  let(:date) { double('date') }
    it "expects an instance of rental to be created" do
      expect(@book.add_rental(person, date)).to be_an_instance_of(Rental)
    end

    it 'adds the Rental instance to the rentals array' do
      rental = @book.add_rental(person, date)
      expect(@book.rentals).to include(rental)
    end
  end

  
end