# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  context 'Edit with' do
    let(:post) { create(:post) }
    it'number' do
      visit edit_post_path(post)
      fill_in 'post[title]', with: '11 11'
      fill_in 'post[text]', with: 'XX XX'
      click_button('Update Post')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit with' do
    let(:post) { create(:post) }
    it'empty title' do
      visit edit_post_path(post)
      fill_in 'post[title]', with: ''
      fill_in 'post[text]', with: 'XX XX'
      click_button('Update Post')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit with' do
    let(:post) { create(:post) }
    it'with one word' do
      visit edit_post_path(post)
      fill_in 'post[title]', with: 'AA'
      fill_in 'post[text]', with: 'XX XX'
      click_button('Update Post')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit with' do
    let(:post) { create(:post) }
    it'lowercase in first part' do
      visit edit_post_path(post)
      fill_in 'post[title]', with: 'aA AA'
      fill_in 'post[text]', with: 'XX XX'
      click_button('Update Post')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit without' do
    let(:post) { create(:post) }
    it'second part' do
      visit edit_post_path(post)
      fill_in 'post[title]', with: 'AA'
      fill_in 'post[text]', with: 'XX XX'
      click_button('Update Post')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end

  context 'Edit with' do
    let(:post) { create(:post) }
    it'with symbols' do
      visit edit_post_path(post)
      fill_in 'post[title]', with: 'A!A A!A'
      fill_in 'post[text]', with: 'XX XX'
      click_button('Update Post')

      assert_text "Title must contain two words(minimum 2 symbols) and '.', first word start with capital letter"
    end
  end
end
