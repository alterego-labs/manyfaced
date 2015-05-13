require 'spec_helper'

class AnotherRenderer; end

describe Manyfaced::Helpers::Renderer::Parameters do
  subject(:helper) { described_class.new(model) }

  let(:model) { AnotherRenderer.new }
  let(:template) { :some_template }

  context 'when generates params for custom rendering' do
    let(:valid_result) do
      { partial: "anothers/shared/#{template}", locals: { another: model } }
    end

    it 'succeeds' do
      expect(helper.gen_custom(template)).to eq valid_result
    end
  end

  context 'when generates params for self rendering' do
    let(:valid_result) do
      { partial: "anothers/render/#{template}", locals: { another: model } }
    end

    it 'succeeds' do
      expect(helper.gen_self(template)).to eq valid_result
    end
  end

  context 'when passing additional options' do
    let(:valid_result) do
      { partial: "anothers/render/#{template}", locals: { another: model, param1: true } }
    end

    it 'succeeds' do
      expect(helper.gen_self(template, {param1: true})).to eq valid_result
    end
  end
end
