# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Commentaries', type: :feature do
  context 'Create' do
    let!(:post) { create(:post) }
    let!(:category) { create(:category, title: 'BB BB') }
    it 'new' do
      visit post_path(post)
      page.fill_in 'comment[body]', with: 'Bob Stinson'
      click_button('Create Comment')
      assert_text 'Post successfully created'
      assert_text 'Bob Stinson'
    end
  end
end