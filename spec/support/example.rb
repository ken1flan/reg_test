RSpec.configure do |config|
  config.before(:each) do |example|
    @example_name = example.full_description
  end
end
