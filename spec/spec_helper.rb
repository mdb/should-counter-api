require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

RSpec.configure do |config|
  ActiveRecord::Migration.maintain_test_schema!
end
