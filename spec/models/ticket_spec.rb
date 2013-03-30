require 'spec_helper'

describe Ticket do
  
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :subject }
  end

  describe "Associations" do
    it { should have_many :ticket_histories }
    it { should belong_to :ticket_status }
    it { should belong_to :admin }
  end

  describe "Methods" do
    before(:each) do
      @admin  = Factory(:admin)
      @ticket = Factory.build(:ticket)
    end

    context "when logged in as admin" do
      before(:each) do
        @admin.confirm!
        sign_in @admin
      end

      describe "search?" do
        it "should return 0 when no matching status id found" do
          Ticket.search(0).length.should == 0
        end

        it "should not return 0 when matching status id found" do
          Ticket.search(1).length.should == 1
        end
      end
    end
  end

end
