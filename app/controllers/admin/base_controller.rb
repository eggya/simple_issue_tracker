# Class Admin::BaseController
#
# Takes care of all common behaviour of an Admin controller
#
# All controller under Admin module, with exception devise related controller,
# should derived from this class
#

class Admin::BaseController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admins'
end