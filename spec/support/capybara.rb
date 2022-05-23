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
end
