# frozen_string_literal: true

class SyncProducts
  def initialize
    shop_url = ENV.fetch('SHOP_URL')
    ShopifyAPI::Base.site = shop_url
  end

  def perform
    product_ids.each do |id|
      product = ShopifyAPI::Product.find(id)
      save_product(product)
      save_variants(product)
    end
  end

  private

  def save_product(product)
    params = ProductSerializer.new(product).serializable_hash
    product = Product.where(params).first_or_initialize
    product.save
  end

  def save_variants(product)
    product.variants.each do |variant|
      local_product = Product.find_by(remote_id: product.id)
      params = ProductVariantSerializer.new(variant).serializable_hash
      new_variant = local_product.variants.new params
      new_variant.save
    end
  end

  def product_ids
    @product_ids ||= ShopifyAPI::Collect.all.collect { |c|
      c.attributes[:product_id]
    }
  end
end
