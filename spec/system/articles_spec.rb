require 'rails_helper'

RSpec.describe 'Article management', type: :system do
  let!(:articles) { create_list(:article, 32) }

  it 'enables me to create widgets' do
    visit '/articles'
  end

  it 'enables me to create widgets' do
    visit '/articles/new'
  end
end
