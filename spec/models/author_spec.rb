require 'rails_helper'

describe "Created author page", type: :model do
  invalid = Author.new(first_name:'Alan', last_name:'', homepage:'http://wikipedia.org/Alan_Turing')
  author = Author.new(first_name:'Alan', last_name:'Turing', homepage:'http://wikipedia.org/Alan_Turing')


  it "Should create and store new author" do
	  expect(author.first_name).to eq('Alan')
	  expect(author.last_name).to eq('Turing')
	  expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end

  it "should return first and last name as one string" do
    expect(author.name).to eq('Alan Turing')
  end

  it "author with no last name shouldnt be valid" do
    expect(invalid).to_not be_valid
  end
end