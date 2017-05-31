# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Inventory' do
  parameter :command, 'Command sent from Slack'
  parameter :text, 'Text that comes after command'
  parameter :user_id, 'User ID of Slacker'
  parameter :user_name, 'User Name of Slacker'

  let(:product) { Fabricate(:product, name: 'Rose Pink') }
  let!(:variant) { Fabricate(:product_variant, name: '10', product: product) }

  post '/api/v1/inventory' do
    header 'Accept', 'application/json,*/*'
    header 'Content-Type', 'application/x-www-form-urlencoded'

    let(:text) { 'Rose Pink 10 1' }
    let(:success_string) { 'Pulled successfully, 69 remaining.' }

    before do
      inventory_pull = double('Inventory::Pull')

      expect(Inventory::Pull).to receive(:new)
        .with(product_name: 'Rose Pink', variant_name: '10', quantity: '1')
        .and_return(inventory_pull)

      expect(inventory_pull).to receive(:perform).and_return success_string
    end

    example_request 'Pull (/pull) product from inventory' do
      expect(response_status).to eq 200
    end
  end
end
