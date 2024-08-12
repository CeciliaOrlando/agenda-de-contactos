class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = current_user.contacts.includes(:phone_numbers, :address, :category).all
    @contacts = @contacts.joins(:category).where(categories: { family: true }) if params[:family]
    @contacts = @contacts.joins(:category).where(categories: { friend: true }) if params[:friend]
    @contacts = @contacts.joins(:category).where(categories: { customer: true }) if params[:customer]
    @contacts = @contacts.joins(:category).where(categories: { supplier: true }) if params[:supplier]
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = current_user.contacts.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to @contact, notice: 'Contacto creado exitosamente.'
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id]) if @contact.nil?
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contacto actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contacto eliminado exitosamente.'
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:full_name, :nickname, :birthday, :photo,
                                    phone_numbers_attributes: [:id, :number, :emergency_number, :_destroy],
                                    address_attributes: [:id, :street, :city, :state, :country, :postal_code, :latitude, :longitude],
                                    category_attributes: [:id, :family, :friend, :customer, :supplier])
  end
end
