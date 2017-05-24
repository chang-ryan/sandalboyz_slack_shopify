# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_variants
  alias variants product_variants

  def total_inventory
    variants.inject(0) do |total, variant|
      total + variant.inventory
    end
  end
end
