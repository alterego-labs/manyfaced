require 'spec_helper'

describe Manyfaced::Config do
  subject(:config) { described_class }

  it { is_expected.to respond_to :render_context }
  it { is_expected.to respond_to :render_context= }
end
