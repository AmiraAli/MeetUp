class CommentsController < ApplicationController
  before_action :authenticate
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # render plain: params.require(:comment).permit(:event_id).inspect
    @eventid=params.require(:comment).permit(:event_id);
    @comment = Comment.new(comment_params)

      if @comment.save
       redirect_to :controller => 'events', :action => 'show', :id => @eventid['event_id']

      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
 
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @post_id=@comment.post_id
    @post=Post.where("id = ?", @post_id)
    @event_id=@post[0]['event_id']
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to :controller => 'events', :action => 'show', :id => @event_id, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post_id=@comment.post_id
    @post=Post.where("id = ?", @post_id)
    @event_id=@post[0]['event_id']
    @comment.destroy
    redirect_to :controller => 'events', :action => 'show', :id => @event_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end
    def authenticate
      if !current_user
        redirect_to :controller => 'home', :action => 'index'
      end
    end
end
