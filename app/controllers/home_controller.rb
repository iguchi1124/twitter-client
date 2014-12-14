class HomeController < ApplicationController
  before_action :sign_in_required, except:[:index]

  def index
  end
end
