require 'rails_helper'
RSpec.feature "Post Add", type: :feature do
    it "Create a new post" do
        visit "/login"
        fill_in "name", with: "khangnx" # Điền tên author vào textfiled Name
        fill_in "password", with: '123456' # Điền tuổi Author vào textfield Age
        click_button "Login" # Click vào button 'Create Author'

        visit "/posts/new"
        fill_in "Body", with: "This ios body post add by test" # Điền tên author vào textfiled Name
        fill_in "User ID", with: 100 # Điền tuổi Author vào textfield Age
        click_button "Add Post" # Click vào button 'Create Author'
        expect(page).to have_text("Post was successfully created.")
    end
end