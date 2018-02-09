require "bundler/setup"
require "front_data_provider"
require 'byebug'
require 'webmock/rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    stub_request(:get, 'https://api2.frontapp.com/conversations?q%5Bstatuses%5D%5B0%5D=unassigned')
      .with(headers: {
              'Accept' => 'application/json',
              'Authorization' => 'Bearer erroneous.token'
            })
      .to_return(status: 401, body: '', headers: {})

    stub_request(:get, 'https://api2.frontapp.com/conversations?q%5Bstatuses%5D%5B0%5D=unassigned')
      .with(headers: {
              'Accept' => 'application/json',
              'Authorization' => 'Bearer correct.token'
            })
      .to_return(status: 200, body: File.read(File.dirname(__FILE__) + '/results.json'))
  end
end
