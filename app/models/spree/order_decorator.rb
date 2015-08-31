Spree::Order.class_eval do
  
  checkout_flow do
    puts "------------------------------------------------------------------do something order checkout_flow"
    go_to_state :address
    go_to_state :delivery
    go_to_state :payment, if: ->(order) {
      order.update_totals
      # order.payment_required?
    }
    go_to_state :confirm
    go_to_state :complete
  end
  
  def payment_required?
    # self.payments.each {|p| puts "\n\r -- #{p.inspect} \n\r"}
    return false
  end
  
end