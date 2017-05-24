# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductSerializer do
  subject { described_class.new(product).serializable_hash }
  let(:product) {
    OpenStruct.new(title: 'name', remote_id: 'remote_id',
                   handle: 'handle', type: 'type')
  }

  it { is_expected.to include :name }
  it { is_expected.to include :remote_id }
  it { is_expected.to include :handle }
  it { is_expected.to include :product_type }
end
