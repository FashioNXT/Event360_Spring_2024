class PostsController < ApplicationController
  require 'httparty'
  before_action :set_post_app
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :get_users, only: [:create, :new, :bytype, :sendto]
  
  def index
    @posts = Post.where(application_id: @nxtapp.id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Posts: #{@posts.count}", template: "posts/index.html.erb"
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Post id: #{@post.id}", template: "posts/show.html.erb"
      end
    end
  end

  def new
    session.delete(:post_recipient)
    session.delete(:post_title)
    session.delete(:post_content)
    @post = params[:post] ? Post.new(post_params) : Post.new
    session[:post_recipient] = @post.recipient if @post.recipient.present?
    session[:post_title] = @post.title if @post.title.present?
    session[:post_content] = @post.content if @post.content.present?
    @user_types
  end

  def edit
  end

  def create
    post_params_new = post_params.dup
    post_params_new[:application_id] = @nxtapp.id
    @post = Post.new(post_params_new)
    if @post.save
      EventMailer.event_created.deliver_later
      redirect_to post_url(id: @post.id), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    post_params_new = post_params.dup
    post_params_new[:application_id] = @nxtapp.id
    if @post.update(post_params_new)
      redirect_to post_url(id: @post.id), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  def bytype
    @user_type = params[:user_type]
    @type_user = @users_by_type[@user_type]
  end

  def sendto
    selected_user_ids = params[:selected_user_ids]
    @type_user = @users.select{ |user| selected_user_ids.include?(user['id'].to_s) }
    recipient_string = @type_user.map{ |user| "#{user['name']} <#{user['email']}>"}.join('; ')
    @post = Post.new({recipient: recipient_string})
    @post.title = session[:post_title] if session[:post_title].present?
    @post.content = session[:post_content] if session[:post_content].present?
    redirect_to new_post_path(post: @post.attributes)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:recipient, :title, :content, :image)
    end

    def set_post_app
      app = params[:app]
      @nxtapp = NxtApps.find_by(name: app)
    end

    def get_users
      users_url = URI::join(@nxtapp.api_url, 'users')
      res = HTTParty.get(users_url)
      if res.success?
        @users = JSON.parse(res.body)
        @users_by_type = {}
        @users.each do |user|
          user_type = user['user_type']
          if @users_by_type.has_key?(user_type)
            @users_by_type[user_type] << user
          else
            @users_by_type[user_type] = [user]
          end
        end
        @user_types = @users_by_type.keys
      else
        # Return with an error
        flash[:error] = 'API URL or @app not set for this application'
        redirect_to '/'
      end
    end
end