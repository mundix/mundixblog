class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    # @article.save
    # redirct_to article_path(@article)
    @article = Article.new(article_param)
    if @article.save
      flash[:notice] = "El articulo fue creado correctamente"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_param
    params.require(:article).permit(:title, :description)
  end

end