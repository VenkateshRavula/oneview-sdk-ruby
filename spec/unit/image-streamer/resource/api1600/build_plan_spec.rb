require 'spec_helper'

klass = OneviewSDK::ImageStreamer::API1600::BuildPlan
RSpec.describe klass do
  include_context 'shared context'
  it 'inherits from API1020' do
    expect(described_class).to be < OneviewSDK::ImageStreamer::API1020::BuildPlan
  end
end
