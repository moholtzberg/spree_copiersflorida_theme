module Spree 
  
  class CouponsController < Spree::StoreController
  
    def show
      render "spree/checkout/coupon_form"
    end
    
    def update
      @order = Spree::Order.find(params[:order][:order_id])
      
      if params[:order] && params[:order][:coupon_code]
        @order.coupon_code = params[:order][:coupon_code]
        handler = PromotionHandler::Coupon.new(@order).apply
        if handler.error.present?
          @order.errors.add(:base, handler.error)
          # respond_with(@order) { |format| format.js { render "spree/checkout/coupon_form" } } and return
          @result = "error"
        elsif handler.success
          flash[:success] = handler.success
          @result = "success"
        end
      end
      
      respond_to do |format|
        # format.html { render "spree/checkout/coupon_form" }
        format.js { render "spree/checkout/coupon_form" }
      end
      
    end
  
  end
  
end