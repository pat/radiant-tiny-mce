module TinyMce
  module ControllerMixin
    def self.included(base)
      base.class_eval do
        def include_stylesheets(*sheets)
          @stylesheets += sheets
        end
        
        def include_javascripts(*scripts)
          @javascripts += scripts
        end
      end
    end
  end
end