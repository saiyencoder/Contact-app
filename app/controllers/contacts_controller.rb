class ContactsController < ApplicationController

  def index                  
    @contacts = Contact.all
  end

  def new
    
  end

  def create
    contact = Contact.new(
                          first_name: params[:first_name],
                          middle_name: params[:middle_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          phone_number: params[:phone_number],
                          bio: params[:bio]
                          )
    contact.save
    redirect_to '/all_contacts/#{contact.id}'
  end

  def show
    @contact = Contact.find(params[:id])                                            
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    contact.assign_attributes(
                              first_name: params[:first_name],
                              middle_name: params[:middle_name],
                              last_name: params[:last_name],
                              email: params[:email],
                              phone_number: params[:phone_number],
                              bio: params[:bio]
                              )

    contact.save
    redirect_to '/all_contacts/#{contact.id}'
  end

  def destory
    contact = Contact.find(params[:id])
    contact.destory
    redirect_to '/all_contacts'
  end

end
