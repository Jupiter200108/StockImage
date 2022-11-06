class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  before_action :get_category
  def get_category
    @categories = Category.all
  end

  before_action :get_image_genre
  def get_image_genre
    @image_genres = Genre.all.where(contents_status: "0")
  end

  before_action :get_video_genre
  def get_video_genre
    @video_genres = Genre.all.where(contents_status: "1")
  end

  private
    # #nameの保存も許可
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email]) # 注目
    end
end
