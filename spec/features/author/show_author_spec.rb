require 'rails_helper'

describe "show author page", type: :feature do

  it "should render withour error" do
    visit author_path(@alan)

    expect(page).to have_text('Alan')
    expect(page).to have_text('Turing')
    expect(page).to have_text('http://wikipedia.de/Alan_Turing')
  end
end
