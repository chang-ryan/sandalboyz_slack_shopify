# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = [:json, :combined_text, :html]
  config.curl_host = 'http://localhost:3000'
  config.curl_headers_to_filter = %w(Cookie Host)
  config.api_name = 'SANDALBOYZ Shopify Microservice API'

  config.request_body_formatter = proc { |params| params.to_json }
end
