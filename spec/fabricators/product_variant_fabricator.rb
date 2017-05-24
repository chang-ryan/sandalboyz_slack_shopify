# frozen_string_literal: false

Fabricator(:product_variant) do
  product
  name { Faker::Beer.unique.name }
  remote_id { Faker::Number.number(10) }
  sku { Faker::Number.number(5) }
  inventory { Faker::Number.number(2) }
end
