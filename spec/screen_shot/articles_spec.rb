require 'rails_helper'

RSpec.describe '記事', type: :system do
  let!(:articles) { create_list(:article, 32) }

  example '記事一覧' do
    visit '/articles'
    save_full_screenshot("#{@example_name}.png")
  end

  example '記事新規作成' do
    visit '/articles/new'
    save_full_screenshot("#{@example_name}.png")
  end
end