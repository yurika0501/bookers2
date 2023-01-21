class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    
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
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)  
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
    # ユーザーに紐づいてるのでuserのストロングパラメはいらない。つけるんだったら新しくメソッドを増やして記述
    # params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
