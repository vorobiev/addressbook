class EmailsController < ApplicationController

  before_filter :check_contact

  def create
    @email = Email.new(email_params.merge!(contact_id: @contact.id))
    if @email.save
      flash[:success] = 'email added'
    end
    redirect_to @contact, notice: t('phonebook.notices.email.created')
  end

  def update
  	@email = Email.find(params[:id])
  	@email.update_attributes(email_params)
  	respond_with_bip @email
  end

  def destroy
    email = Email.find(params[:id])
    email.destroy
    redirect_to @contact, notice: t('phonebook.notices.email.deleted')
  end

  private

    def check_contact
      @contact = Contact.find(params[:contact_id])
    end

    def email_params
      params.require(:email).permit(:name)
    end

end
