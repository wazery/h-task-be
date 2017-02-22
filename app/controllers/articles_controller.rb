class ArticlesController < ApplicationController
  before_action :set_article, only: %w(show edit update destroy)
  before_action :check_if_user_logged_in, except: %w(index show)

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    # Use find_by to not raise an exception if user is not found
    user = User.find_by(id: @article.user_id)
    @author_name = user.user_name if user
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def check_if_user_logged_in
    # Gaurd clause to check if user is not yet logged in
    redirect_to new_user_session_path, flash: { errors: 'Please login first!' } unless user_signed_in?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :description, :user_id)
  end
end
