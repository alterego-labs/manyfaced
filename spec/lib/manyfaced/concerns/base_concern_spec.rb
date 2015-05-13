require 'spec_helper'

class BaseModelConcern
  def initialize(base)
  end
end

class NonModuleUserSomeConcern < BaseModelConcern;end
class NonModuleUser
  extend Manyfaced::Concerns::Base
end

module SomeExtensions
  module SomeSubModule
    class UserSomeConcern < BaseModelConcern; end
    class User
      extend Manyfaced::Concerns::Base
    end
  end
end


describe Manyfaced::Concerns::Base do
  subject(:model) { test_class.new }

  context 'concerning non moduled model' do
    let(:test_class) { NonModuleUser }

    it 'succeeds' do
      test_class.build_concern :some_concern
      expect(model.some_concern).to be_kind_of NonModuleUserSomeConcern
    end
  end

  context 'concerning moduled model' do
    let(:test_class) { SomeExtensions::SomeSubModule::User }

    it 'succeeds' do
      test_class.build_concern :some_concern
      expect(model.some_concern).to be_kind_of SomeExtensions::SomeSubModule::UserSomeConcern
    end
  end
end
