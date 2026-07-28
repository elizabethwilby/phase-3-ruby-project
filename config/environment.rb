ENV["RACK_ENV"] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV.fetch("RACK_ENV", nil))
require "active_record"

require "yaml"
db_config = YAML.load_file(File.join(__dir__, "database.yml"))
ActiveRecord::Base.establish_connection(db_config[ENV.fetch("RACK_ENV", "development")])

require_all "app/models"
