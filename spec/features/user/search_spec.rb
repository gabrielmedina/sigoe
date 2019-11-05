# frozen_string_literal: true

require 'rails_helper'

context 'Find users by your search scope' do
  before(:each) do
    @sector = FactoryBot.create(:sector)
    @users = FactoryBot.create_list(:user, 2, sector: @sector)
    FactoryBot.create(
      :permission,
      user: @users.first,
      entity: User
    )
    sign_in @users.first
  end

  feature 'search user' do
    %w[name email siape sector].each do |attr|
      scenario "find with attribute #{attr}" do
        visit users_path
        fill_in 'search', with: @users.first.read_attribute(attr)
        click_button 'Buscar'
        expect(page).to have_content(@users.first.name)
      end
    end

    scenario 'find with fail attribute' do
      visit users_path
      fill_in 'search', with: 'wrong_attribute'
      click_button 'Buscar'
      expect(page).to have_content('Sua busca por wrong_attribute não obteve resutados')
    end
  end
end
