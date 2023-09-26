class ArticlesController < ApplicationController
  before_action :authenticate_user!
  include Ransack::Helpers::FormHelper
 
  def index
    @q = Article.ransack(params[:q])
    Rails.logger.debug @q.result.to_sql # Add this line for debugging
    @articles = @q.result(distinct: true)
  end
  

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
   
    @article = Article.new(article_params)
    @article.user_id = current_user.id 

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    if current_user == @article.user
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if current_user == @article.user
    @article.destroy
    redirect_to root_path, status: :see_other
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
