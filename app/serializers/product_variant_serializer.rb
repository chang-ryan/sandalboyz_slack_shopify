# frozen_string_literal: true

class ProductVariantSerializer < ApplicationSerializer
  attributes :name, :remote_id, :sku, :inventory

  def name
    object.title
  end

  def remote_id
    object.id
  end

  def sku
    object.sku
  end

  def inventory
    object.inventory_quantity
  end
end
