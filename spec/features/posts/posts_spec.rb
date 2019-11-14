# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  context 'Create' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it'new post' do
      visit new_post_path
      fill_in 'post[title]', with: 'MM MM'
      fill_in 'post[text]', with: 'TT TT'
      select 'BB BB', from: 'Category'
      attach_file('post[image]', '/home/admin1/Desktop/test.jpeg')
      click_button('Подтвердить')

      expect(page).to have_content 'Название поста'
      expect(page.find('img')['src']).to include('large_test.jpeg')
    end
  end

  context 'Edit' do
    let!(:post) { create(:post) }
    it'current post' do
      visit edit_post_path(post)
      fill_in 'post[title]', with: 'XX XX'
      fill_in 'post[text]', with: 'XX XX'
      click_button('Update Post')

      expect(page).to have_content 'Название поста: XX XX'
    end
  end

  context 'Delete' do
    let(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB', posts: [post]) }
    it 'post from category' do
      visit category_path(category)
      click_link('Удалить пост')
      page.accept_alert
    end
  end
end
