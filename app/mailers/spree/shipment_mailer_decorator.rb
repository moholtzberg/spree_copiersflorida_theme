Spree::ShipmentMailer.class_eval do

  def shipped_email(shipment, resend = false)
    @shipment = shipment.respond_to?(:id) ? shipment : Spree::Shipment.find(shipment)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Store.current.name} #{Spree.t('shipment_mailer.shipped_email.subject')} ##{@shipment.order.number}"
    puts "=================="
    puts "=================="
    puts "=====#{@shipment.order.email}====="
    puts "=================="
    puts "=================="
    mg_client = Mailgun::Client.new(SECRET["MAILGUN_API_KEY"])
    message_params = {
      :to => @order.email,
      :from => 'orders@copiersfliorida.com',
      :subject => subject,
      :html => render_to_string("spree/mailers/shipment_email", :layout => "spree/layouts/base_email").to_str
    }
    puts mg_client.send_message("mg.copiersflorida.com", message_params)
  end

end