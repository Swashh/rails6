# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Commentaries', type: :feature do

  context 'Create with' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it 'number' do
      visit post_path(post)
      page.fill_in 'comment[body]', with: '11 11'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it 'empty field' do
      visit post_path(post)
      page.fill_in 'comment[body]', with: ''
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it 'one word' do
      visit post_path(post)
      page.fill_in 'comment[body]', with: 'AA'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it 'lowercase in first part' do
      visit post_path(post)
      page.fill_in 'comment[body]', with: 'aA AA'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it 'second part' do
      visit post_path(post)
      page.fill_in 'comment[body]', with: 'AA'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it 'symbols' do
      visit post_path(post)
      page.fill_in 'comment[body]', with: 'A!A A!A'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end
end
