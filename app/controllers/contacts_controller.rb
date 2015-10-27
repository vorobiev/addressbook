class ContactsController < ApplicationController

  before_filter :fetch_contact, only: [:show, :edit, :update, :destroy, :share, :sendmail]

  def index
    @contacts = Contact.order(:last_name, :first_name).all
  end

  def new
    @contact = Contact.new
    @contact.phones.build
    @contact.emails.build
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update_attributes(contact_update_params)
      redirect_to @contact, notice: t('phonebook.notices.contact.updated')
    else
      render 'edit'
    end
  end

  def create
    @contact = Contact.new(contact_creation_params)
    if @contact.save
      redirect_to @contact, notice: t('phonebook.notices.contact.created')
    else
      render 'new'
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: t('phonebook.notices.contact.deleted')
  end

  def export
    @contacts = Contact.order(:last_name)
    if @contacts.any?
      send_data @contacts.export, filename: 'contacts.csv'
    else
      redirect_to contacts_path
    end
  end

  def import
  end

  def proceed
    processed = Contact.import(params[:file])
    redirect_to contacts_path , notice: t('phonebook.notices.import.processed', count: processed)
  end

  def share
  end

  def sendmail
    ContactMailer.share(@contact, params[:email]).deliver_now
    redirect_to contacts_path , notice: t('phonebook.notices.share.sent')
  end

  private

    def contact_creation_params
      params.require(:contact).permit(:first_name, :last_name, phones_attributes: [ :name ], emails_attributes: [ :name ])
    end

    def contact_update_params
      params.require(:contact).permit(:first_name, :last_name)
    end

    def fetch_contact
      @contact = Contact.find(params[:id])
    end

end
