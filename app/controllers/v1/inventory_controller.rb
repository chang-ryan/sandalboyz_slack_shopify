# frozen_string_literal: true

module V1
  class InventoryController < ApplicationController
    def index; end

    def create
      message = ::Inventory::Pull.new(product_name: product_name,
                                      variant_name: variant_name,
                                      quantity: quantity).perform

      render_message(message)
    end

    private

    def product_name
      @product_name ||= permitted_params[:text].scan(/[A-Za-z]+/)
                                               .map(&:capitalize).join(' ')
    end

    def variant_name
      @variant_name ||= permitted_params[:text].scan(/[0-9]+/).first
    end

    def quantity
      @quantity ||= permitted_params[:text].scan(/[0-9]+/).last
    end

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
