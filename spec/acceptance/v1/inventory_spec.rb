# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Segments' do
  header 'Accept', 'application/json,*/*'

  parameter :command, 'Command sent from Slack'
  parameter :text, 'Text that comes after command'
  parameter :user_id, 'User ID of Slacker'
  parameter :user_name, 'User Name of Slacker'

  let(:product) { Fabricate(:product) }

  post '/api/v1/inventory' do
    let(:command) { '/pull' }
    let(:text) { 'Firenzi 10 1' }
    let(:user_id) { 1 }
    let(:user_name) { 'ryan' }

    example_request 'Pull (/pull) product from inventory' do
      expect(response_status).to eq 200
    end
  end
end
