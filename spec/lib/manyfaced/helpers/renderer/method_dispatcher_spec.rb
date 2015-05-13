require 'spec_helper'

describe Manyfaced::Helpers::Renderer::MethodDispatcher do
  subject(:dispatcher) { described_class.new(concern, model) }

  let(:concern) { double(:concern) }
  let(:model) { double(:model, renderer: renderer) }
  let(:renderer) { double(:renderer) }
  let(:args) { double(:args) }

  context 'when dispatching no default method' do
    let(:action) { :some_action }

    it 'redirects it to model' do
      expect(model).to receive(action)
      dispatcher.call action, args
    end
  end

  context 'when dispatching method for renderer' do
    let(:action) { :render_some_template }

    it 'redirects it to renderer default action' do
      expect(renderer).to receive(:default_action).with :some_template, args
      dispatcher.call action, args
    end
  end
end
