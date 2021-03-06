require 'test_helper'

module RongCloud
  class ConfigurationTest < Minitest::Test
    def setup
      RongCloud.configure do |config|
        config.host = nil
      end
    end

    def test_app_key_settings_and_reading
      RongCloud::Configuration.app_key = "test_key"
      assert_equal "test_key", RongCloud::Configuration.app_key
    end

    def test_app_secret_settings_and_reading
      RongCloud::Configuration.app_secret = "test_secret"
      assert_equal "test_secret", RongCloud::Configuration.app_secret
    end

    def test_default_host_and_setting_and_reading
      assert_equal "https://api.cn.ronghub.com", RongCloud::Configuration.host
      RongCloud::Configuration.host = "http://other.host.com"
      assert_equal "http://other.host.com", RongCloud::Configuration.host
    end
  end
end