class ArticlesController < ApplicationController
    
    # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        # reqest params check
        # render plain: params[:article].inspect

        # creating new article
        # @article = Article.new(params[:article])

        # creating new article and validating the required feilds
        # @article = Article.new(params.require(:article).permit(:title, :text))
        
        # using reusable method 
        @article = Article.new(article_params)
       
       # article model validation check
        # article.save will return true or false on the basis of the article validation
        #
       if  @article.save
          redirect_to @article
       else
          render 'new'
       end
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
    

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
