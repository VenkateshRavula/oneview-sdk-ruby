require 'spec_helper'

klass = OneviewSDK::ImageStreamer::API2010::DeploymentGroup
RSpec.describe klass do
  include_context 'shared context'

  it 'inherits from API2000' do
    expect(described_class).to be < OneviewSDK::ImageStreamer::API2000::DeploymentGroup
  end
end
