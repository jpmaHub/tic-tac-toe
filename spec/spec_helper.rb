require 'view_board'
require 'set_mark'
require 'mark'
require 'outcomes'
require 'file_mark_gateway'
require 'web_app'
require 'rack/test'
require 'AI'


RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end
  RSpec::Support::ObjectFormatter.default_instance.max_formatted_output_length = 10000

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
