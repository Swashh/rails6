# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  context 'Create with' do
    it'number' do
      visit '/categories/new'
      fill_in 'category[title]', with: '11 11'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Create Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit with' do
    it'empty title' do
      visit '/categories/new'
      fill_in 'category[title]', with: ''
      fill_in 'category[text]', with: 'LL LL'
      click_button('Create Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit with' do
    it'one word' do
      visit '/categories/new'
      fill_in 'category[title]', with: 'AA'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Create Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit with' do
    it'lowercase in first part' do
      visit '/categories/new'
      fill_in 'category[title]', with: 'aA AA'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Create Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end
  context 'Edit catetegory without' do
    it'second part' do
      visit '/categories/new'
      fill_in 'category[title]', with: 'AA'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Create Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit catetegory with' do
    it'symbols' do
      visit '/categories/new'
      fill_in 'category[title]', with: 'A!A A!A'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Create Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end
end
