class ColorsController < ApplicationController
  before_action :set_user
  before_action :set_color, only: [:show, :edit, :update, :destroy]

  # GET users/1/colors
  def index
    @colors = @user.colors
  end

  # GET users/1/colors/1
  def show
  end

  # GET users/1/colors/new
  def new
    @color = @user.colors.build
  end

  # GET users/1/colors/1/edit
  def edit
  end

  # POST users/1/colors
  def create
    @color = @user.colors.build(color_params)

    if @color.save
      redirect_to([@color.user, @color], notice: 'Color was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/colors/1
  def update
    if @color.update_attributes(color_params)
      redirect_to([@color.user, @color], notice: 'Color was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/colors/1
  def destroy
    @color.destroy

    redirect_to user_colors_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_color
      @color = @user.colors.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def color_params
      params.require(:color).permit(:hexa, :description, :user_id)
    end
end
