Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "form_submissions_converted_admin_configurations_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :text => "<%= configurations_sidebar_menu_item Spree.t('spree_inquiries.inquiries'), admin_inquiries_path %>",
                     :disabled => false)