# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let!(:category) { create(:category) }

  it'Edit Category with number' do
    visit edit_category_path(category)
    fill_in 'category[title]', with: '11 11'
    fill_in 'category[text]', with: 'LL LL'
    click_button('Update Category')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  it'Edit Category with empty title' do
    visit edit_category_path(category)
    fill_in 'category[title]', with: ''
    fill_in 'category[text]', with: 'LL LL'
    click_button('Update Category')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  it'Edit Category with one word' do
    visit edit_category_path(category)
    fill_in 'category[title]', with: 'AA'
    fill_in 'category[text]', with: 'LL LL'
    click_button('Update Category')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  it'Edit Category with lowercase in first part' do
    visit edit_category_path(category)
    fill_in 'category[title]', with: 'aA AA'
    fill_in 'category[text]', with: 'LL LL'
    click_button('Update Category')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  it'Edit Category without second part' do
    visit edit_category_path(category)
    fill_in 'category[title]', with: 'AA'
    fill_in 'category[text]', with: 'LL LL'
    click_button('Update Category')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  it'Edit Category with symbols' do
    visit edit_category_path(category)
    fill_in 'category[title]', with: 'A!A A!A'
    fill_in 'category[text]', with: 'LL LL'
    click_button('Update Category')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end
end
