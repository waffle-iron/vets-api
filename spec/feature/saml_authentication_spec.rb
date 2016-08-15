require 'rails_helper'
require 'capybara/rspec'
require 'capybara/webkit'
Capybara.default_driver = :webkit

describe "SAML Authentication", type: :feature do
  it 'fetches a new session endpoint' do
    visit 'http://localhost:3000/v0/sessions/new'
    binding.pry
  end
end
