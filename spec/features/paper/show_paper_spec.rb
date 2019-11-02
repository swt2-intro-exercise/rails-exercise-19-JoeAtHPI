require 'rails_helper'

describe "show paper page", type: :feature do
  before(:each) do
    @author = FactoryBot.create :author
    @paper = FactoryBot.create :paper
  end

  it "should display author's full name" do
    visit paper_path(@paper)
    @paper.authors << @author
    expect(page).to have_text(@author.name)
  end
end

