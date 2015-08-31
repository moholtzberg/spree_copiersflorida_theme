Spree::Shipment.class_eval do
  
  def determine_state(order)
    puts "----------------------------------------- Whats here"
    puts "----------------------------------------- #{determine_if_paid_with_credit_line(order)}"
    return 'canceled' if order.canceled?
    return 'pending' unless order.can_ship?
    return 'pending' if inventory_units.any? &:backordered?
    return 'shipped' if state == 'shipped'
     (order.paid? || determine_if_paid_with_credit_line(order)) || Spree::Config[:auto_capture_on_dispatch] ? 'ready' : 'pending'
  end
  
  def determine_if_paid_with_credit_line(order)
    return Spree::Order.find(order.id).payments.where(:payment_method_id => Spree::PaymentMethod.find_by(:type => "Spree::PaymentMethod::CreditLine", :active => true), :state => "completed").count > 0
  end
  
end