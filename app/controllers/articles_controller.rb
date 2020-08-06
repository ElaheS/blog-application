class ArticlesController < ApplicationController
	before_action :set_article , only: [:show]

	def new
		@article = Article.new
	end


	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article is successfully created"
			redirect_to article_path(@article)
		end
		#render plain: params[:article].inspect
	end

	def show
	end

	def index
		@articles = Article.all
	end


	private

	def set_article
		@article = Article.find(params[:id])		
	end

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
