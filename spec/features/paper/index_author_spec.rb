require 'rails_helper'

describe "index paper page", type: :feature do
  before(:each) do
    @paper = FactoryBot.create :paper
  end

  it "should filter objects by year" do
    visit papers_path(year: @paper.year)
    expect(page).to have_text(@paper.year)

    visit papers_path(year: @paper.year+1)
    expect(page).to_not have_text(@paper.year)
  end

end
