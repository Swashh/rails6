# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  let(:post) { create(:post) }
  it'Create without category' do
    visit new_post_path
    fill_in 'post[title]', with: 'MM MM'
    fill_in 'post[text]', with: 'TT TT'
    click_button('Подтвердить')
    expect(page).to have_content 'Category must exist'
  end

  let(:post) { create(:post) }
  let!(:categories) { create_list(:category, 3) }
  let!(:category) { create(:category, title: 'BB BB') }
  it'Create with number' do
    visit new_post_path
    fill_in 'post[title]', with: '11 11'
    fill_in 'post[text]', with: 'TT TT'
    select 'BB BB', from: 'Category'
    click_button('Подтвердить')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  let(:post) { create(:post) }
  let!(:categories) { create_list(:category, 3) }
  let!(:category) { create(:category, title: 'BB BB') }
  it'Create with empty title' do
    visit new_post_path
    fill_in 'post[title]', with: ''
    fill_in 'post[text]', with: 'TT TT'
    select 'BB BB', from: 'Category'
    click_button('Подтвердить')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  let(:post) { create(:post) }
  let!(:categories) { create_list(:category, 3) }
  let!(:category) { create(:category, title: 'BB BB') }
  it'Create with one word' do
    visit new_post_path
    fill_in 'post[title]', with: 'AA'
    fill_in 'post[text]', with: 'TT TT'
    select 'BB BB', from: 'Category'
    click_button('Подтвердить')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  let(:post) { create(:post) }
  let!(:categories) { create_list(:category, 3) }
  let!(:category) { create(:category, title: 'BB BB') }
  it'Create with lowcase in first part' do
    visit new_post_path
    fill_in 'post[title]', with: 'aA AA'
    fill_in 'post[text]', with: 'TT TT'
    select 'BB BB', from: 'Category'
    click_button('Подтвердить')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  let(:post) { create(:post) }
  let!(:categories) { create_list(:category, 3) }
  let!(:category) { create(:category, title: 'BB BB') }
  it'Create withot second part' do
    visit new_post_path
    fill_in 'post[title]', with: 'AA'
    fill_in 'post[text]', with: 'TT TT'
    select 'BB BB', from: 'Category'
    click_button('Подтвердить')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end

  let(:post) { create(:post) }
  let!(:categories) { create_list(:category, 3) }
  let!(:category) { create(:category, title: 'BB BB') }
  it'Create with symbols' do
    visit new_post_path
    fill_in 'post[title]', with: 'A!A A!A'
    fill_in 'post[text]', with: 'TT TT'
    select 'BB BB', from: 'Category'
    click_button('Подтвердить')
    expect(page).to have_content "Title must contain two words(mininmum 2 symbols) and '.', first word start with capital letter"
  end
end
