
require_relative '../lib/enumeration_updater.rb'
require_relative '../lib/category_updater.rb'
require_relative '../lib/channel_updater.rb'
EnumerationUpdater.update_enumerations_and_category_enumerations
CategoryUpdater.update_categories
ChannelUpdater.update_channels_and_categories
AdminUser.create(email: ENV["EMAIL1"], password: ENV["PASSWORD"], password_confirmation: ENV["PASSWORD"]) if not AdminUser.exists?(email:ENV["EMAIL1"])