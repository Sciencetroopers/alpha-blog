class PagesController  <  ApplicationController
  def home
    redirect_to articles_path if logged_in?
    #if they're logged in, they'll go to articles page
  end

  def about
  end
end
