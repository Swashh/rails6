# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Commentaries', type: :feature do

  context 'Create with' do
    let!(:category) { create(:category) }
    it 'number' do
      visit '/categories'
      click_link('Показать')
      page.fill_in 'comment[body]', with: '11 11'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:category) { create(:category) }
    it 'empty field' do
      visit '/categories'
      click_link('Показать')
      page.fill_in 'comment[body]', with: ''
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:category) { create(:category) }
    it 'one word' do
      visit '/categories'
      click_link('Показать')
      page.fill_in 'comment[body]', with: 'AA'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:category) { create(:category) }
    it 'lowercase in first part' do
      visit '/categories'
      click_link('Показать')
      page.fill_in 'comment[body]', with: 'aA AA'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:category) { create(:category) }
    it 'second part' do
      visit '/categories'
      click_link('Показать')
      page.fill_in 'comment[body]', with: 'AA'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end

  context 'Create with' do
    let!(:category) { create(:category) }
    it 'symbols' do
      visit '/categories'
      click_link('Показать')
      page.fill_in 'comment[body]', with: 'A!A A!A'
      click_button('Create Comment')

      assert_text "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do end"
    end
  end
end
