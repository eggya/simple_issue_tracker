require 'spec_helper'

describe Admin do

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe "Associations" do
    it { should have_many :tickets }
  end

  describe "Methods" do
  end
end
