# frozen_string_literal: true

class InventoryController < ApplicationController
  def create
    render json: inventory
  end
end
