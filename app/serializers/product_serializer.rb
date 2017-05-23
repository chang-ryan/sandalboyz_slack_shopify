# frozen_string_literal: true

class ProductSerializer < ApplicationSerializer
  attributes :name, :remote_id, :handle, :product_type

  def name
    object.title
  end

  def remote_id
    object.id
  end

  def handle
    object.handle
  end

  def product_type
    object.product_type
  end
end
