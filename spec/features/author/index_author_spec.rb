require 'rails_helper'

describe "index author page", type: :feature do
  alan = FactoryBot.create :author

  it "should render withour error" do
    visit authors_path
  end

  it "should list all authors in a table with respective links" do
    visit authors_path
    expect(page).to have_table
    @table = find('table');
    expect(@table).to have_text('Name')
    expect(@table).to have_text('Homepage')

    expect(@table).to have_text(alan.name)
    expect(@table).to have_text(alan.homepage)
    expect(@table).to have_link 'Show', href: author_path(alan)
    expect(@table).to have_link 'Edit', href: edit_author_path(alan)
  end

  it "page should have a link to create a new author" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end
end
