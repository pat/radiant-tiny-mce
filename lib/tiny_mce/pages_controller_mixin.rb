module TinyMce
  module PagesControllerMixin
    def self.included(base)
      base.class_eval do
        before_filter :add_jquery_and_tinymce
        
        private
        
        def add_jquery_and_tinymce
          include_javascripts(
            "extensions/tiny_mce/jquery",
            "extensions/tiny_mce/tiny_mce/tiny_mce",
            "extensions/tiny_mce/tiny_mce/tiny_mce_settings",
            "extensions/tiny_mce/application",
            "admin/ruledtable"
          )
          include_stylesheets(
            "admin/assets"
          )
        end
      end
    end
  end
end