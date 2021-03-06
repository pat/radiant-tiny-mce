# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

require 'tiny_mce'

class TinyMceExtension < Radiant::Extension
  version "0.5"
  description "Tiny MCE Filter and Asset Management (via Paperclipped)"
  url "http://freelancing-gods.com"
  
  TinyMce::TinyMceFilter
  
  define_routes do |map|
    map.resources(:tiny_mce,
      :controller   => 'admin/tiny_mce',
      :path_prefix  => 'admin',
      :collection   => {
        :images => :get,
        :files  => :get
      }
    )
  end
  
  def activate
    # We don't want any Content Type limitations. Default for Paperclipped
    # does not include PDFs, Word and Excel Documents - things that quite
    # likely will be linked to.
    if ActiveRecord::Base.connection.tables.include?("config")
      Radiant::Config['assets.content_types'] = ""
    end
    
    ApplicationController.class_eval  { include TinyMce::ControllerMixin }
    Admin::PagesController.class_eval { include TinyMce::PagesControllerMixin }
  end
end
