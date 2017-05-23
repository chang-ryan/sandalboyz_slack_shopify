# frozen_string_literal: true

class SyncProducts
  def initialize
    shop_url = ENV.fetch('SHOP_URL')
    ShopifyAPI::Base.site = shop_url
  end

  def perform
    product_ids.each do |id|
      product = ShopifyAPI::Product.find(id)
      params = ProductSerializer.new(product).serializable_hash
      product = Product.where(params).first_or_initialize
      product.save
    end
  end

  private

  def product_ids
    @product_ids ||= ShopifyAPI::Collect.all.collect { |c|
      c.attributes[:product_id]
    }
  end
end
