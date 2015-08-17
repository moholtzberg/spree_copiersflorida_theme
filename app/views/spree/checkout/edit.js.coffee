partial = "<%=j render :partial => 'form_wrapper', :format => :html, :locals => { :state => @order.state, :order => @order } %>"
step = ($ '#checkout_<%= @order.state %>_panel')
error = "<%= flash[:error] %>"
summary = "<%=j render :partial => 'summary', :format => :html, :locals => {:order => @order} %>"
console.log(error)
$("#errors").html(error)
$("div[id$=_panel_body]").collapse()
$("#checkout_<%= @order.state %>_panel").replaceWith(partial);
#js = "<%= render :inline => 'app/assets/javascripts/spree/frontend/checkout/payment.js.coffee' %>"
#alert(js)
