require 'spec_helper'

class SomeController; end

describe Manyfaced::Helpers::Controller::SettingRenderContext do
  subject(:helper) { described_class }

  let(:controller_class) { SomeController }

  context 'when including' do
    it 'sets before action' do
      allow(controller_class).to receive(:before_action).with :manyfaced_set_current_render_context
      controller_class.send :include, helper
    end

    it 'defines method for before action' do
      allow(controller_class).to receive(:before_action)
      controller_class.send :include, helper
      expect(controller_class.instance_methods).to include :manyfaced_set_current_render_context
    end
  end
end
