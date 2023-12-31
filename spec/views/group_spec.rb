require 'rails_helper'
RSpec.describe 'groups/new', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', password: 'password', email: 'tom@hostname.com',
                        password_confirmation: 'password')
    @group = @user.groups.create(name: 'Group1', icon: 'http://hostname/123.jpg', description: 'description',
                                 user_id: @user.id)

    visit(new_user_session_path)
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end

  describe "Visit groups' index page" do
    it 'should have group header' do
      visit(groups_path)
      expect(page).to have_text('Transactions')
    end

    it 'should have group name' do
      visit(new_group_path)
      expect(page).to have_text('New group')
    end

    it 'should have group icon' do
      visit(new_group_path)
      expect(page).to have_text('Icon')
    end

    it 'should have new page link' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, '< Groups List', exact: true)
    end

    it 'redirect to transactions page' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, 'Save Category', exact: true)
    end

    it 'redirect to add new group' do
      visit(groups_path)
      click_link('Add a new category', exact: true)
      expect(page).to have_current_path(new_group_path)
    end
  end
end
