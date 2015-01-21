Spree::BaseHelper.module_eval do
  
  def breadcrumbs(taxon, separator="")
    return "" if current_page?("/") || taxon.nil?
    
    crumbs = [[Spree.t(:home), spree.root_path]]
    
    if taxon
      crumbs << [Spree.t(:products), products_path]
      crumbs += taxon.ancestors.collect { |a| [a.name, spree.nested_taxons_path(a.permalink)] } unless taxon.ancestors.empty?
      crumbs << [taxon.name, spree.nested_taxons_path(taxon.permalink)]
    else
      crumbs << [Spree.t(:products), products_path]
    end

    separator = raw(separator)

    crumbs.map! do |crumb|
      content_tag(:li, itemscope:"itemscope", itemtype:"http://data-vocabulary.org/Breadcrumb") do
        link_to(crumb.last, itemprop: "url") do
          content_tag(:span, crumb.first, itemprop: "title")
        end + (crumb == crumbs.last ? '' : separator)
      end
    end

    content_tag(:div, content_tag(:div, raw(crumbs.map(&:mb_chars).join), class: 'breadcrumb'), id: 'breadcrumbs', class: 'hidden-xs col-sm-12 col-md-12')
  end
  
  def taxons_tree(root_taxon, current_taxon, max_level = 1)
    puts "#{root_taxon.inspect}"
    return '' if max_level < 1 || root_taxon.children.empty?
    content_tag :ul, class: 'list-group' do
      root_taxon.children.map do |taxon|
        # css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
        content_tag :li, class: "list-group-item" do
         link_to(taxon.name, seo_url(taxon)) +
         taxons_tree(taxon, current_taxon, max_level - 1)
        end
      end.join("\n").html_safe
    end
  end
  
end