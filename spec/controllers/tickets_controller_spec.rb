require 'spec_helper'

describe TicketsController do

  # This should return the minimal set of attributes required to create a valid
  # Ticket. As you add validations to Ticket, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TicketsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET new" do
    it "assigns a new ticket as @ticket" do
      get :new, {}, valid_session
      assigns(:ticket).should be_a_new(Ticket)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ticket" do
        expect {
          post :create, {:ticket => valid_attributes}, valid_session
        }.to change(Ticket, :count).by(1)
      end

      it "assigns a newly created ticket as @ticket" do
        post :create, {:ticket => valid_attributes}, valid_session
        assigns(:ticket).should be_a(Ticket)
        assigns(:ticket).should be_persisted
      end

      it "redirects to the created ticket" do
        post :create, {:ticket => valid_attributes}, valid_session
        response.should redirect_to(Ticket.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ticket as @ticket" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ticket.any_instance.stub(:save).and_return(false)
        post :create, {:ticket => {}}, valid_session
        assigns(:ticket).should be_a_new(Ticket)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ticket.any_instance.stub(:save).and_return(false)
        post :create, {:ticket => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

end
