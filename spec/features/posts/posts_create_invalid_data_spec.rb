# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  context 'create without' do
    let(:post) { create(:post) }
    it'Create without category' do
      visit new_post_path
      fill_in 'post[title]', with: 'MM MM'
      fill_in 'post[text]', with: 'TT TT'
      click_button('Подтвердить')
      expect(page).to have_content 'Category must exist'
    end
  end

  context 'create without' do
    let(:post) { create(:post) }
    let!(:categories) { create_list(:category, 3) }
    let!(:category) { create(:category, title: 'BB BB') }
    it'number' do
      visit new_post_path
      fill_in 'post[title]', with: '11 11'
      fill_in 'post[text]', with: 'TT TT'
      select 'BB BB', from: 'Category'
      click_button('Подтвердить')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'create with' do
    let(:post) { create(:post) }
    let!(:categories) { create_list(:category, 3) }
    let!(:category) { create(:category, title: 'BB BB') }
    it'empty title' do
      visit new_post_path
      fill_in 'post[title]', with: ''
      fill_in 'post[text]', with: 'TT TT'
      select 'BB BB', from: 'Category'
      click_button('Подтвердить')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'create with' do
    let(:post) { create(:post) }
    let!(:categories) { create_list(:category, 3) }
    let!(:category) { create(:category, title: 'BB BB') }
    it'one word' do
      visit new_post_path
      fill_in 'post[title]', with: 'AA'
      fill_in 'post[text]', with: 'TT TT'
      select 'BB BB', from: 'Category'
      click_button('Подтвердить')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'create with' do
    let(:post) { create(:post) }
    let!(:categories) { create_list(:category, 3) }
    let!(:category) { create(:category, title: 'BB BB') }
    it'lowcase in first part' do
      visit new_post_path
      fill_in 'post[title]', with: 'aA AA'
      fill_in 'post[text]', with: 'TT TT'
      select 'BB BB', from: 'Category'
      click_button('Подтвердить')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'create without' do
    let(:post) { create(:post) }
    let!(:categories) { create_list(:category, 3) }
    let!(:category) { create(:category, title: 'BB BB') }
    it'second part' do
      visit new_post_path
      fill_in 'post[title]', with: 'AA'
      fill_in 'post[text]', with: 'TT TT'
      select 'BB BB', from: 'Category'
      click_button('Подтвердить')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'create with' do
    let(:post) { create(:post) }
    let!(:categories) { create_list(:category, 3) }
    let!(:category) { create(:category, title: 'BB BB') }
    it'Create symbols' do
      visit new_post_path
      fill_in 'post[title]', with: 'A!A A!A'
      fill_in 'post[text]', with: 'TT TT'
      select 'BB BB', from: 'Category'
      click_button('Подтвердить')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end
end
