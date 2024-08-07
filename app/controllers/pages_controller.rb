class PagesController < ApplicationController
  def home
    @contacts = Contact.all
  end

end
