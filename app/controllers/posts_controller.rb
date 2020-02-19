class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :confirm, :destroy]
  before_action :new_post, only: [:new]
  before_action :set_user
  before_action :login_check, only: [:index,:new]
  before_action :correct_user, only: [:edit, :update, :confirm, :destroy]

  def login
  end

  def index
    @posts = @user.posts.all
  end

  def search
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @user.posts.new(post_params)
    if Post.last.present?
      next_id = Post.last.id + 1
    else
      next_id = 1
    end
    make_picture(next_id)
    @post
    if @post.save
      redirect_to confirm_path(@post)
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      make_picture(@post.id)
      redirect_to confirm_path(@post)
    else
      render :edit
    end
  end

  def confirm
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
    end
  end

  private

    def login_check
      if session[:user_id].nil?
        redirect_to action:'login'
      else
        @user = User.find(session[:user_id])
      end
    end


    def correct_user
      user = User.find(session[:user_id])
      post = Post.find(params[:id])
      unless  user.id == post.user_id
        redirect_to root_path
      end
    end

    def set_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :picture,:title, :kind,:tag_list, :desire)
    end

    def new_post
      @post = Post.new
    end

    def make_picture(id)
      sentense = ""
    # ⑨-1 改行を消去
      content = @post.content.gsub(/\r\n|\r|\n/," ")
      title = @post.title.gsub(/\r\n|\r|\n/," ")
      desire = @post.desire.gsub(/\r\n|\r|\n/," ")
    # ⑨-2 contentの文字数に応じて条件分岐
      if content.length <= 28 then
        # ⑨-3 28文字以下の場合は7文字毎に改行
        n = (content.length / 20).floor + 1
        n.times do |i|
          s_num = i * 20
          f_num = s_num + 19
          range =  Range.new(s_num,f_num)
          sentense += content.slice(range)
          sentense += "\n" if n != i+1
        end
        # ⑨-4 文字サイズの指定
        pointsize = 60
      elsif content.length <= 50 then
        n = (content.length / 20).floor + 1
        n.times do |i|
          s_num = i * 20
          f_num = s_num + 19
          range =  Range.new(s_num,f_num)
          sentense += content.slice(range)
          sentense += "\n" if n != i+1
        end
        pointsize = 55
      else
        n = (content.length / 20).floor + 1
        n.times do |i|
          s_num = i * 20
          f_num = s_num + 19
          range =  Range.new(s_num,f_num)
          sentense += content.slice(range)
          sentense += "\n" if n != i+1
        end
        pointsize = 45
      end

      sentense_of_desire = ""
      if desire.length <= 28 then
        # ⑨-3 28文字以下の場合は7文字毎に改行
        n = (desire.length / 10).floor + 1
        n.times do |i|
          s_num = i * 10
          f_num = s_num + 9
          range =  Range.new(s_num,f_num)
          sentense_of_desire += desire.slice(range)
          sentense_of_desire += "\n" if n != i+1
        end
        # ⑨-4 文字サイズの指定
        fontsize = 60
      elsif desire.length <= 50 then
        n = (desire.length / 20).floor + 1
        n.times do |i|
          s_num = i * 20
          f_num = s_num + 19
          range =  Range.new(s_num,f_num)
          sentense_of_desire += desire.slice(range)
          sentense_of_desire += "\n" if n != i+1
        end
        fontsize = 45
      else
        n = (desire.length / 30).floor + 1
        n.times do |i|
          s_num = i * 30
          f_num = s_num + 29
          range =  Range.new(s_num,f_num)
          sentense_of_desire += desire.slice(range)
          sentense_of_desire += "\n" if n != i+1
        end
        fontsize = 35
      end


    # ⑨-5 文字色の指定
      color = "white"
      # ⑨-6 文字を入れる場所の調整（0,0を変えると文字の位置が変わります）
      draw = "text 0,0 '#{sentense}'"
      # ⑨-7 フォントの指定
      font = Rails.root.join('app').join('.fonts').join("GenEiGothicN-U-KL.otf")
      # ⑨-8 ↑これらの項目も文字サイズのように背景画像や文字数によって変えることができます
      # ⑨-9 選択された背景画像の設定



      base = Rails.root.join("app/assets/images/top.png")

      # ⑨-11 minimagickを使って選択した画像を開き、作成した文字を指定した条件通りに挿入している
      image = MiniMagick::Image.open(base)
      image.combine_options do |i|
        i.font font
        i.fill color
        i.gravity 'center'
        i.pointsize pointsize
        i.draw draw
      end

      image.combine_options do |i|
        i.font font
        i.fill 'white'
        i.gravity 'south'
        i.pointsize 70
        i.draw "text 0,480 '#{title}'"
      end

      image.combine_options do |i|
        i.font font
        i.fill 'white'
        i.gravity 'center'
        i.pointsize fontsize
        i.draw "text 0,220 '#{sentense_of_desire}'"
      end




      # ⑨-12 保存先のストレージの指定。Amazon S3を指定する。
      storage = Fog::Storage.new(
        provider: 'AWS',
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region: 'ap-northeast-1'
      )
      # ⑨-13 開発環境or本番環境でS3のバケット（フォルダのようなもの）を分ける
      case Rails.env
        when 'production'
          # ⑨-14 バケットの指定・URLの設定
          bucket = storage.directories.get('i-am-production')
          # ⑨-15 保存するディレクトリ、ファイル名の指定（ファイル名は投稿id.pngとしています）
          png_path = 'images/' + id.to_s + '.png'
          image_uri = image.path
          file = bucket.files.create(key: png_path, public: true, body: open(image_uri))
          @post.picture = 'https://s3-ap-northeast-1.amazonaws.com/i-am-production' + "/" + png_path
        when 'development'
          bucket = storage.directories.get('i-am-development')
          png_path = 'images/' + id.to_s + '.png'
          image_uri = image.path
          file = bucket.files.create(key: png_path, public: true, body: open(image_uri))
          @post.picture = 'https://s3-ap-northeast-1.amazonaws.com/i-am-development' + "/" + png_path
      end
    end
end
