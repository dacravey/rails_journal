require 'rails_helper'

describe "the edit a comment process" do

  it "edits a comment" do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Add a comment'
    fill_in 'Commenter name', :with => 'Mary'
    fill_in 'Thoughts', :with => 'FIRRRST!'
    click_on 'Create Comment'
    click_on 'Edit Comment'
    fill_in 'Commenter name', :with => 'Mary'
    fill_in 'Thoughts', :with => 'FIRST!'
    click_on 'Update Comment'
    expect(page).to have_content 'updated'
  end

  it "gives error when no commenter name is entered" do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Add a comment'
    fill_in 'Commenter name', :with => 'Mary'
    fill_in 'Thoughts', :with => 'FIRRRST!'
    click_on 'Create Comment'
    click_on 'Edit Comment'
    fill_in 'Commenter name', :with => ''
    fill_in 'Thoughts', :with => 'FIRST!'
    click_on 'Update Comment'
    expect(page).to have_content 'errors'
  end

end
