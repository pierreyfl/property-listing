class ArticlesController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index and return }
      format.json { render json: Article.all }
    end

  end

  def create
    article = Article.new
    article.title = params[:title]
    article.content = params[:content]

    if article.save!
      render json: article and return
    end

    render json: article.errors, status: :unprocessable_entity


  end

  def update
    article =Article.find(params[:id])

    article.title = params[:title]
    article.content = params[:content]

    if article.save!
      render json: article and return
    end

    render json: article.errors, status: :unprocessable_entity
  end

  def destroy
    Article.delete(params[:id])
  end
end