class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit]

     # 一覧表示
  def index
    if params[:genre].present?
      @books = Book.where(genre: params[:genre])
    else
      @books = Book.all
    end
  end
  
  # 詳細ページ表示
  def show
    @book = Book.find(params[:id])
  end
  
  # 作成
  def new
    @book = Book.new
  end
  
  # 登録
  def create
     @book = Book.new(book_params)
     @book.user = current_user
    if @book.save
      redirect_to @book
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  # 編集
  def edit
    @book = Book.find(params[:id])
   
  end
  
  # 更新
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
  # 削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search
    @books = Book.where("title LIKE ?", "%#{params[:query]}%")
    render :index
  end

  

  private
  def book_params
    params.require(:book).permit(:title, :name, :content, :author, :image_url, :genre, :rating)
  end

 

end
