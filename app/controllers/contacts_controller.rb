class ContactsController < ApplicationController
  def contacts_action
    @contact_1 = Contact.find(1)
    @contact_2 = Contact.find(2)
    @contact_3 = Contact.find(3)
    @contact_4 = Contact.find(4)
    render 'contacts_page.html.erb'
  end
end
