# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#total_inventory' do
    it 'sums up the inventory from the variants' do
      product = Fabricate(:product) {
        product_variants(count: 2, inverse_of: :product) {
          Fabricate(:product_variant, inventory: 10)
        }
      }

      expect(product.total_inventory).to eq 20
    end
  end
end
