# Load the rails application
require File.expand_path('../application', __FILE__)

# Make sure the app doesn't appear to be illiterate
ActiveSupport::Inflector.inflections do |inflect|
	inflect.irregular 'brohoof', 'brohooves'
end

# Initialize the rails application
Rainblog::Application.initialize!