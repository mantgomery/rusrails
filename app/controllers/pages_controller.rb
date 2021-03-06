class PagesController < ApplicationController
  def index
    @homepage = Page.matching("home") ||
        Page.create(:name => "Homepage", :url_match => "home")
  end

  def show
    if  @category = Category.matching(params[:category_url_match]) and
        @page = @category.pages.matching(params[:url_match])
      @pages = @category.pages.enabled
    else
      render_404
    end
  end

  def map
  end

end
