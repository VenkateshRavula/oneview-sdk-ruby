require 'spec_helper'

klass = OneviewSDK::API500::C7000::WebServerCertificate
RSpec.describe klass, integration: true, type: CREATE, sequence: seq(klass) do
  let(:current_client) { $client_500 }
  let(:current_secrets) { $secrets }
  include_examples 'WebServerCertificateCreateExample', 'integration api500 context'
end
