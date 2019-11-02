require 'rails_helper'

describe "Delete author", type: :feature do
  before(:each) do
    @alan = FactoryBot.create :author
    visit authors_path
  end

  it "should delete the author instance in the database" do
    expect(Author.count).to eq(1)
    find('a[data-method="delete"]').click
    expect(Author.count).to eq(0)
  end

end
