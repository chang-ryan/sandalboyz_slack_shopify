# frozen_string_literal: false

Fabricator(:product) do
  name { Faker::Beer.unique.name }
  remote_id { Faker::Number.number(10) }
  handle { |attrs| attrs[:name].downcase.tr(' ', '-') }
  product_type { 'Sandals' }
end
