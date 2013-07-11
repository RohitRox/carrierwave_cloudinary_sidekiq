require "sidekiq/web"

REDIS_CONFIG = YAML.load_file(File.expand_path("../redis.yml", File.dirname(__FILE__)))[Rails.env].with_indifferent_access
sidekiq_config = YAML::load(File.open("#{Rails.root}/config/sidekiq.yml"))
sidekiq_db = sidekiq_config[:database]

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{REDIS_CONFIG['host']}:#{REDIS_CONFIG['port']}/#{sidekiq_db}", namespace: 'sidekiq' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{REDIS_CONFIG['host']}:#{REDIS_CONFIG['port']}/#{sidekiq_db}", namespace: 'sidekiq', size: 1 }
end

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == "admin" && password == "admin"
end
