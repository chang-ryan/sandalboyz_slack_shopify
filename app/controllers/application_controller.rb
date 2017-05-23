# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize

  def authorize
    shop_url = ENV.fetch('SHOP_URL')
    ShopifyAPI::Base.site = shop_url
  end
end
