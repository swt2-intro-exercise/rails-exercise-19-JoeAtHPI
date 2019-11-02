require 'rails_helper'

describe "New author page", type: :feature do
  before(:each) do
    @alan = FactoryBot.create :author
  end

  it "should render withour error" do
    visit edit_author_path(@alan)
  end

  it "should edit the values and save them to the database" do
    visit edit_author_path(@alan)
    page.fill_in 'author[first_name]', with: 'Hello'
    page.fill_in 'author[last_name]', with: 'World'
    page.fill_in 'author[homepage]', with: '!'
    find('input[type="submit"]').click
    @alan.reload
    expect(@alan.last_name).to eq('World')
  end
end