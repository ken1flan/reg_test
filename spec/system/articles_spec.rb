require 'rails_helper'

RSpec.describe 'Article management', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'enables me to create widgets' do
    visit "/articles/new"
  end
end
