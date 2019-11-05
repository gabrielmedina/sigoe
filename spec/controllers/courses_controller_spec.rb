# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    @attr = FactoryBot.attributes_for(:course)
    @model = FactoryBot.create(:course)
    @entity = 'Course'
    @path = courses_path
  end

  include_examples 'permission_controller'

  describe 'POST #create' do
    context 'params with empty value' do
      it 'renders page with error message' do
        add_permission @entity, @user, create: true
        sign_in @user
        post :create, params: { "#{@entity.downcase}": { name: '' } }
        expect(response).to render_template(:new)
        expect(flash[:error]).to_not be_nil
        expect(flash[:error].first).to match(/não pode ficar em branco/)
      end
    end
  end

  describe 'PUT #update' do
    context 'params with empty value' do
      it 'renders page with error message' do
        add_permission @entity, @user, update: true
        sign_in @user
        put :update, params: { id: @model.id, "#{@entity.downcase}": { name: '' } }
        expect(response).to render_template(:edit)
        expect(flash[:error]).to_not be_nil
        expect(flash[:error].first).to match(/não pode ficar em branco/)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'params with empty value' do
      it 'renders page with error message' do
        expect_any_instance_of(Course).to receive(:destroy).and_return(false)

        add_permission @entity, @user, destroy: true
        sign_in @user
        delete :destroy, params: { id: @model.id }
        expect(response).to render_template(:new)
        expect(flash[:error]).to_not be_nil
      end
    end
  end
end
