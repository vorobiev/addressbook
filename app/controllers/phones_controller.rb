class PhonesController < ApplicationController

  before_filter :check_contact

  def create
    @phone = Phone.new(phone_params.merge!(contact_id: @contact.id))
    if @phone.save
      flash[:success] = 'phone added'
    end
    redirect_to @contact, notice: t('phonebook.notices.phone.created')
  end

  def update
    @phone = Phone.find(params[:id])
    @phone.update_attributes(phone_params)
    respond_with_bip @phone
  end


  def destroy
    phone = Phone.find(params[:id])
    phone.destroy
    redirect_to @contact, notice: t('phonebook.notices.phone.deleted')
  end

  private

    def check_contact
      @contact = Contact.find(params[:contact_id])
    end

    def phone_params
      params.require(:phone).permit(:name)
    end

end
