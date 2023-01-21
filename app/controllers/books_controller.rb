class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def index
    @user = User.find(current_user.id)
  end

  # def create
  #   # １.&2. データを受け取り新規登録するためのインスタンス作成
  #   book = Book.new(book_params)
    
  #   # 3. データをデータベースに保存するためのsaveメソッド実行
  #   book.save
  #   # 4. ブック詳細ページにリダイレクト
  #   redirect_to book_path(book.id)
  # end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
