# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validation tests' do
    let(:category) { build(:category) }
    it 'with valid title and text' do
      expect(category.valid?).to eq(true)
    end

    context 'when valid title and text' do
      let(:category) { build(:category, title: 'Aa. AA') }
      it 'return true' do
        expect(category.valid?).to eq(true)
      end
    end

    context 'when more then 2 words' do
      let(:category) { build(:category, title: 'AA AA GFG', text: '123') }
      it 'return true' do
        expect(category.save).to eq(true)
      end
    end

    context 'when title is empty' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    context 'when title with numbers' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    context 'with sym in title' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    context 'with first one letter' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    context 'with first one letter' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    context 'when with dowcase in title and text' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    context 'when with one word in title' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    context 'when with dowcase in title and text' do
      let(:category_invalid) { build(:category, :category_invalid) }
      it 'return false' do
        expect(category_invalid.valid?).to eq(false)
      end
    end

    # describe Category do
    #   test "route test" do
    #     assert_generates '/categories/1', { controller: 'categories', action: 'show', id: '1' }
    # assert_generates '/posts', {controller: 'posts', action: 'show'}
    #   end
    # end
  end
end
