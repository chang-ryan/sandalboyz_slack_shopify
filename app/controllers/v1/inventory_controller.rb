# frozen_string_literal: true

class InventoryController < ApplicationController
  def index; end

  def create
    render json: inventory
  end

  private

  def permitted_params; end
end
