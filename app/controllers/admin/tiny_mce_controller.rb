class Admin::TinyMceController < ApplicationController
  layout "eye_eye"
  helper :tiny_mce
  
  before_filter :add_javascripts_and_stylesheets
  
  WebImageTypes = %w( image/jpg image/jpeg image/gif image/png image/x-png )
  
  def images
    include_javascript "admin/tiny_mce/images"
    
    conditions = ["asset_content_type IN (?)", WebImageTypes]
    unless params[:title].blank?
      conditions.first << " AND title LIKE ?"
      conditions << "%#{params[:title]}%"
    end
    
    @assets = Asset.paginate(
      :page       => params[:page] || 1,
      :per_page   => 12,
      :conditions => conditions,
      :order      => "title ASC"
    )
  end
  
  def files
    include_javascript "admin/tiny_mce/files"
    
    conditions = nil
    unless params[:title].blank?
      conditions = ["title LIKE ?", "%#{params[:title]}%"]
    end
    
    @assets = Asset.paginate(
      :page       => params[:page] || 1,
      :per_page   => 12,
      :conditions => conditions,
      :order      => "title ASC"
    )
    
    @home_page = Page.find(:first,
      :conditions => {:parent_id => nil},
      :include    => :children
    )
  end
  
  private
  
  def add_javascripts_and_stylesheets
    include_stylesheets "admin/tiny_mce"
    include_javascripts(
      "extensions/tiny_mce/jquery",
      "extensions/tiny_mce/tiny_mce/tiny_mce_popup"
    )
  end
end