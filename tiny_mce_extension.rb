# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

require 'tiny_mce'

class TinyMceExtension < Radiant::Extension
  version "1.0"
  description "Tiny MCE Filter and Asset Management (via Paperclipped)"
  url "http://freelancing-gods.com"
  
  TinyMce::TinyMceFilter
  
  define_routes do |map|
    map.resource :images,
      :controller   => 'admin/images',
      :path_prefix  => 'admin'
  end
  
  def activate
    ApplicationController.class_eval  { include TinyMce::ControllerMixin }
    Admin::PagesController.class_eval { include TinyMce::PagesControllerMixin }
  end
end
