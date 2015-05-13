require 'spec_helper'

class User;end
class UserConcern < SimpleDelegator;end

module SomeConcerns
  class User;end
  class UserConcern < SimpleDelegator;end
end

describe Manyfaced::Helpers::Renderer::ModelConcern do
  context 'concern for unmoduled model' do
    let(:test_class) { UserConcern }

    it 'returns model correctly' do
      test_class.send :include, Manyfaced::Helpers::Renderer::ModelConcern
      expect(test_class.new.model).to eq User
    end
  end

  context 'concern for moduled model' do
    let(:test_class) { SomeConcerns::UserConcern }

    it 'returns model correctly' do
      test_class.send :include, Manyfaced::Helpers::Renderer::ModelConcern
      expect(test_class.new.model).to eq SomeConcerns::User
    end
  end
end
