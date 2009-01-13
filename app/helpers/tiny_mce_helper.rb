module TinyMceHelper
  def ordered_list(page)
    content_tag(:option, spaced_title(page), :value => page.url) +
    page.children.collect { |child| ordered_list(child) }.join("\n")
  end
  
  def spaced_title(page)
    title   = page.title
    parent  = page
    
    while (parent = parent.parent)
      title = "&nbsp;&nbsp;" + title
    end
    
    title
  end
end