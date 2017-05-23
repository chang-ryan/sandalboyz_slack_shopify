# frozen_string_literal: true

module V1
  class InventoryController < ApplicationController
    def index; end

    def create
      response = {
        response_type: 'in_channel',
        text: 'SANDALBOYZ',
        attachments: [
          {
            text: 'Partly cloudy today and tomorrow'
          }
        ]
      }
      render json: response
    end

    private

    def permitted_params; end
  end
end
