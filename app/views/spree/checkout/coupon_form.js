console.log("weve been rendered")
$("#myModalBody").html("<%=j render :partial => 'spree/checkout/coupon_form.html.erb', :format => :html, :locals => { :order => @order } %>")
$("#myModalBody").append("<%= @order.number %>" + "<%= params[:order][:coupon_code] %>")
if ("<%= @result %>" == "success") {
	window.location.reload()
} else {
	$("#myModalBody").append("<%= flash[:error] %>")
};
// $.ajax({
//   method: "PATCH",
//   url: Spree.url("<%= update_checkout_path(@order.state) %>"),
//   {
//     coupon_code: "<%= params[:order][:coupon_code] %>",
//     token: "<%= @order.guest_token %>"
//   }
// }).done(function() {
//   window.location.reload();
// }).fail(function(msg) {
//   if (msg.responseJSON["error"]) {
//     // show_flash 'error', msg.responseJSON["error"]
// 		alert(msg.responseJSON["error"])
//   } else {
//     // show_flash 'error', "There was a problem adding this coupon code."
//   }
// });
