Spree::OrderMailer.class_eval do

  def confirm_email(order, resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Store.current.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
    # mail(to: @order.email, from: from_address, subject: subject)
    puts "=================="
    puts "=================="
    puts "=====#{@order.email}====="
    puts "=================="
    puts "=================="
    sendgrid = SendGrid::Client.new(api_user: 'copiersflorida', api_key: '#copiers138')
    mail = SendGrid::Mail.new do |m|
      m.to = @order.email
      m.from = 'orders@copiersfliorida.com'
      m.subject = subject
      html_body = render_to_string("spree/mailers/confirm_email", :layout => "spree/layouts/base_email")
      m.html = html_body.to_str
    end
    puts sendgrid.send(mail)
  end

end