require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        title: "Title",
        body: "MyText"
      ),
      Article.create!(
        title: "Title",
        body: "MyText"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "ul>li", text: "Title".to_s, count: 2
  end
end
