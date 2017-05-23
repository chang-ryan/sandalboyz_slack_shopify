# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_variants
  alias variants product_variants
end
