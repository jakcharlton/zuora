module Zuora
  module Objects
    class Contact
      attr_accessor :account_id, :address1, :address2, :city, :country, :county, :description, :fax, :first_name,
                    :home_phone, :last_name, :mobile_phone, :nick_name, :other_phone, :other_phone_type,
                    :personal_email, :postal_code, :state, :tax_region, :work_email, :work_phone

    end

    BillToContact = Contact
  end
end

