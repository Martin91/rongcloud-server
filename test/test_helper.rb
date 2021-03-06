begin
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start
rescue LoadError => e
  warn e.message
end

require 'minitest/autorun'
require 'byebug'
require 'rong_cloud'
require 'fileutils'

def rong_cloud_configure_with_settings
  RongCloud.configure do |config|
    config.app_key = ENV["RONGCLOUD_APP_KEY"]
    config.app_secret = ENV["RONGCLOUD_APP_SECRET"]
    config.host = ENV["RONGCLOUD_API_HOST"] || "https://api.cn.ronghub.com"
    config.timeout = 10
    config.debug_mode = true

    FileUtils.mkdir_p "log/"
  end
end