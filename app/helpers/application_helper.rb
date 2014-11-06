module ApplicationHelper
	def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => BootstrapLinkRenderer
    end
    super *[collection_or_options, options].compact
  end

  def form_group_tag(errors, &block)
   if errors.any?
     content_tag :div, capture(&block), class: 'form-group has-error'
   else
     content_tag :div, capture(&block), class: 'form-group'
   end
  end
  
end
