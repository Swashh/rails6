# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  context 'Edit category with' do
    let!(:category) { create(:category) }
    it'number' do
      visit edit_category_path(category)
      fill_in 'category[title]', with: '11 11'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Update Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit category with' do
    let!(:category) { create(:category) }
    it'empty title' do
      visit edit_category_path(category)
      fill_in 'category[title]', with: ''
      fill_in 'category[text]', with: 'LL LL'
      click_button('Update Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit category with' do
    let!(:category) { create(:category) }
    it'one word' do
      visit edit_category_path(category)
      fill_in 'category[title]', with: 'AA'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Update Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit category with' do
    let!(:category) { create(:category) }
    it'lowercase in first part' do
      visit edit_category_path(category)
      fill_in 'category[title]', with: 'aA AA'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Update Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit category without' do
    let!(:category) { create(:category) }
    it'second part' do
      visit edit_category_path(category)
      fill_in 'category[title]', with: 'AA'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Update Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit category with' do
    let!(:category) { create(:category) }
    it'symbols' do
      visit edit_category_path(category)
      fill_in 'category[title]', with: 'A!A A!A'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Update Category')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end
end
