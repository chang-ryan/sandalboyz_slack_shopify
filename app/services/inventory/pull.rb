# frozen_string_literal: true

module Inventory
  class Pull
    attr_reader :product_name, :variant_name, :quantity

    def initialize(product_name:, variant_name:, quantity:)
      @product_name = product_name
      @variant_name = variant_name
      @quantity = quantity.to_i
    end

    def perform
      remote_variant = ShopifyAPI::Variant.find(variant.remote_id)
      if (remote_variant.inventory_quantity -= quantity).negative?
        'Not enough in stock. Nothing was pulled.'
      else
        remote_variant.save
        "Pulled successfully, #{remote_variant.inventory_quantity} remaining."
      end
    end

    private

    def product
      @product ||= Product.find_by(name: product_name)
    end

    def variant
      @variant ||= product.variants.find_by(name: variant_name)
    end
  end
end
