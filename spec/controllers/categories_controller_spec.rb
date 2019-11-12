require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'return success' do
    it 'return a success response' do
      get :index
      expect(response).to have_http_status(200)
    end

    describe 'GET :show' do
      let(:category) { Category.create(title: 'AA AA', text: 'AA AA' ) }
      it 'respons success' do
        get :show, params: { id: category }
        expect(response).to have_http_status(200)
      end
    end

    describe 'PUT :update ' do
      let(:category) { create(:category) }
      it'category valid data' do
        put :update, params: { id: category.to_param, category: { title: 'LOh PIdrr', text: 'LOh PIdrr' }}
        expect(response).to have_http_status(302)
        category.reload
        expect(category.text).to have_content 'LOh PIdrr'
        expect(category.title).to have_content 'LOh PIdrr'
      end
    end

    describe 'PUT :update ' do
      let(:category) { create(:category) }
      it 'category invalid data' do
        put :update, params: { id: category.to_param, category: { title: 'Loh PIdrr', text: '' }}
        expect(response).to have_http_status(200)
        expect(response).to_not be_redirect
      end
    end

    describe '#destroy' do
        let! (:category) { create(:category) }
        it 'removes post from table' do
          expect {delete :destroy, params:
              {id: category.to_param , category:
                  {title: category.title, text: category.text}}}.to change(Category, :count).by(-1)
        end
      end
   end
end
