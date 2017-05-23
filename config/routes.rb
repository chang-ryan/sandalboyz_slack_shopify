# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    namespace :v1 do
      resources :inventory, only: %i[index create]
    end
  end
end
