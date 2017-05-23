# frozen_string_literal: true

namespace :sync_products do
  desc 'Manually sync/seed database with product data from Shopify'
  task :run, [] => [:environment] do |_task, _args|
    SyncProducts.new.perform
  end
end
