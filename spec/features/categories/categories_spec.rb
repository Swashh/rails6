# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  context 'Create' do
    let!(:category) { create(:category) }
    it'Category' do
      visit '/categories/new'
      click_link('Home page')
      click_link('Показать')
      page.should have_content('Посты')
    end
  end

  context 'Edit' do
    let!(:category) { create(:category) }
    it'Category' do
      visit edit_category_path(category)
      fill_in 'category[title]', with: 'OO OO'
      fill_in 'category[text]', with: 'LL LL'
      click_button('Update Category')
    end
  end

  context 'Delete' do
    let!(:category) { create(:category) }
    it 'Category' do
      visit categories_path
      click_link('Удалить')
      page.accept_alert
    end
  end
end
