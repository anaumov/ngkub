# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ngkub::Application.initialize!

Ngkub::Application.config.gem(
  'thinking-sphinx', :version => '1.4.10'
)
