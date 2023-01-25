class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit]
  
  def new
    @books = Book.new
  end

  def index
    @user = User.find(current_user.id)
    # @book = Book.new
    @books = Book.all
    @newbook = Book.new
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
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @newbook = Book.new # @bookを他で使いたかったので「new」を追記
    @books = Book.all #いらないと思うが消したらエラーになる
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    # @user = User.find(params[:id])
    # @newbook = Book.new #違ってたらパラムスに変更
    @book = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)  
    else
      render :edit
    end
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
    # ユーザーに紐づいてるのでuserのストロングパラメはいらない。つけるんだったら新しくメソッドを増やして記述
    # params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user_id = Book.find(params[:id]).user.id
    unless user_id == current_user.id
      redirect_to books_path
    end
  end
  
end