require 'rails_helper'

RSpec.describe StaticPagesController, type: :feature do
  context 'routing is working properly' do
    scenario "on the / page" do
      visit '/'
      expect(page).to have_css("h1", text: "Home")
    end
  end
end

