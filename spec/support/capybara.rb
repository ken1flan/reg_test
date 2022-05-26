Capybara.configure do |config|
  config.default_max_wait_time = 30
  config.server_port = 50_000
end

RSpec.configure do |config|
  config.before(:each, type: :system) do |example|
    Capybara.session_name = example.metadata[:driver] || :default
    using = ENV["WITH_GUI"].blank? ? :headless_chrome : :chrome
    driven_by :selenium, using: using, screen_size: [1024, 768]

    # 自ホストURLオプション設定
    Rails.application.routes.default_url_options[:host] = Capybara.current_session.server.host
    Rails.application.routes.default_url_options[:port] = Capybara.current_session.server.port
  end

  def save_full_screenshot(path)
    width  = Capybara.page.execute_script("return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);")
    height = Capybara.page.execute_script("return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")

    window = Capybara.current_session.driver.browser.manage.window
    size_org = window.size

    window.resize_to(width+100, height+100)

    page.save_screenshot path

    window.resize_to(*size_org)
  end
end
