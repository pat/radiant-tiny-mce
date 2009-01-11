class Admin::ImagesController < ApplicationController
  layout "eye_eye"
  
  before_filter :add_javascripts_and_stylesheets
  
  WebImageTypes = %w( image/jpg image/jpeg image/gif image/png image/x-png )
  
  def show
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
  
  private
  
  def add_javascripts_and_stylesheets
    include_stylesheets "admin/images"
    include_javascripts(
      "extensions/tiny_mce/jquery",
      "extensions/tiny_mce/tiny_mce/tiny_mce_popup",
      "admin/images/show"
    )
  end
end