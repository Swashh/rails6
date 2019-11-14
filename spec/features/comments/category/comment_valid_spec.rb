# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Commentaries', type: :feature do
  context 'Create' do
    let!(:category) { create(:category) }
    it 'new' do
      visit '/categories'
      click_link('Показать')
      page.fill_in 'comment[body]', with: 'Bob Stinson'
      click_button('Create Comment')
      assert_text 'Post successfully created'
      assert_text 'Bob Stinson'
    end
  end
end