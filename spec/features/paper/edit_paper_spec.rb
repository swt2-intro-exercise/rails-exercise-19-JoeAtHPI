require 'rails_helper'

describe "edit paper page", type: :feature do
  before(:each) do
    @authors = FactoryBot.create_list(:author, 10)
    @paper = FactoryBot.create :paper
  end

  it "selection lists all authors" do
    visit edit_paper_path(@paper)
    @selection = find('select[multiple="multiple"]')
    @authors.each do |author|
      expect(@selection).to have_text(author.name)
    end
  end

  it "edits selected authors with selection" do
    visit edit_paper_path(@paper)
    @selection = find('select[multiple="multiple"]')
    @authorEntries = @selection.find_all(:xpath, 'option', text: @authors[0].name)
    @authorEntries.each do |authorEntry|
      authorEntry.select_option
    end
    find('input[type="submit"]').click
    @paper.reload
    expect(@paper.authors.count).to eq(@authorEntries.count)
  end
end


