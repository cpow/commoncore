# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Commoncore::Application.initialize!

require 'will_paginate'
WillPaginate.per_page = 5