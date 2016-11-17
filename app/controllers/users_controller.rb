class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :classregis]
  before_filter :authorizestudent, only: [:index, :show, :classregis]
  before_filter :authorizeadmin, only: [:userlist, :edit]
   before_filter :set_cache_buster

  
   


  # GET /users
  # GET /users.json
  def index
    r = User.find_by_id(current_user.id)
      @course_list = r.courses
  end
  
  def userlist
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end
  
  def classregis
    
  end

  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login2_path, notice: 'Success!! Please Log In Now.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_number_two
    @user = User.find params[:id]

    if @user.update(user_params)
      redirect_to userhome_path, :notce => "Registration completed"
    else
      redirect_to userhome_path, :notice => "Try Again"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :major, :password, :password_confirmation, :year, course_ids: [])
    end
    
    def usercourse_params
      params.require(:user).permit(course_ids:[])
    end
end
