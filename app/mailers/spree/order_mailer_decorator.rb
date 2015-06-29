Spree::OrderMailer.class_eval do
  
  def confirm_email(order, resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Store.current.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
    puts "=================="
    puts "=================="
    puts "=====#{@order.email}====="
    puts "=================="
    puts "=================="
    mg_client = Mailgun::Client.new(SECRET["MAILGUN_API_KEY"])
    message_params = {
      :to => @order.email,
      :from => 'orders@copiersfliorida.com',
      :subject => subject,
      :html => render_to_string("spree/mailers/confirm_email", :layout => "spree/layouts/base_email").to_str
    }
    puts mg_client.send_message("mg.copiersflorida.com", message_params)
  end

end