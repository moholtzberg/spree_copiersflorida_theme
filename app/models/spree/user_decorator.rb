Spree.user_class.class_eval do
  # has_many :form_submissions, ->(object) {where("email = ?", object.email)}, :class_name => Spree::FormSubmission
  has_many :inquiries, :foreign_key => :email, :primary_key => :email, :class_name => Spree::Inquiry
    
end