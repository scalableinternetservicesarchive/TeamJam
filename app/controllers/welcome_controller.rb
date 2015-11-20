class WelcomeController < ApplicationController
  layout :false
  def index
    hel = ""
    fresh_when(hel)
  end
end
