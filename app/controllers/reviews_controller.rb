class ReviewsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create] 

    def new
        @book = Book.find(params[:book_id])
        @review = @book.reviews.build
      end

    def create
        @book = Book.find(params[:book_id])
        @review = @book.reviews.build(review_params)
        @review.user = current_user  # ログイン中のユーザーを関連付ける

    # if @review.save
    #      redirect_to book_path(@book)
    # else
    #     render 'books/show'
    # end

    if @review.save
        redirect_to book_path(@book)  # レビューが保存できたら本のページにリダイレクト
      else
        render 'new', status: :unprocessable_entity  # 保存できなかった場合は再度フォームを表示
      end
    end
    
    def destroy
        @book = Book.find(params[:book_id])
        @review = @book.reviews.find(params[:id])
        @review.destroy
        redirect_to @book, status: :see_other
    end

    private
    def review_params
      params.require(:review).permit(:name, :content)
    end
end
