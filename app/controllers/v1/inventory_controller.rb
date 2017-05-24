# frozen_string_literal: true

module V1
  class InventoryController < ApplicationController
    def index; end

    def create
      options = params[:text].split
      variant_id = Product.find_by(name: options[0].capitalize)
                          .variants.find_by(name: options[1]).remote_id
      variant = ShopifyAPI::Variant.find(variant_id)
      if (variant.inventory_quantity -= options[2].to_i).negative?
        render_message('Not enough in stock.')
      else
        variant.save
        render_message("Pulled successfully, #{variant.inventory_quantity} remaining.")
      end
    end

    private

    def render_message(message)
      render json: {
        response_type: 'in_channel',
        text: message
      }
    end

    def permitted_params
      params.permit(:command, :text, :user_id, :user_name, :response_url)
    end
  end
end
