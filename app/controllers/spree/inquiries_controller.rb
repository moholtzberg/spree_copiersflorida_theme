class Spree::InquiriesController < Spree::StoreController
  
  # def new
  #   render :partial => "spree/layouts/static/contact"
  # end
  
  def create
    
    name = params[:form_submission][:name].sub!(/\s*[^A-z0-9]*\z/,'')
    email = params[:form_submission][:email].sub!(/\s*[^A-z0-9]*\z/,'')
    message = params[:form_submission][:message].sub!(/\s*[^A-z0-9]*\z/,'')
    is_human = params[:form_submission][:is_human].sub!(/\s*[^0-9]*\z/,'')
    puts "********************************************"
    puts "********************************************"
    puts "********************************************"
    puts "++++ #{name} ++++"
    puts "++++ #{email} ++++"
    puts "++++ #{message} ++++"
    puts "********************************************"
    puts "********************************************"
    form_submission = Spree::Inquiry.new({email: email, name: name, message: message})

    puts "[[[[[[[[[[[[[[[[[[[[[#{form_submission.inspect}]]]]]]]]]]]]]]]]]]]]]"
    # @review.product = @product
    # @review.user = spree_current_user if spree_user_signed_in?
    # @review.ip_address = request.remote_ip
    # @review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]
    # 
    # authorize! :create, @review
    # if @review.save
    #   flash[:notice] = Spree.t('review_successfully_submitted')
    #   redirect_to spree.product_path(@product)
    # else
    #   render :new
    # end
    if is_human == "7"
      puts "ITS A HUMAN"
      if form_submission.save!
        puts "ITS A OK"
        flash[:notice] = "Thank you!"
        redirect_to "/contact"
      end
    end
  end
  
end