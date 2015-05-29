class OwnersController < ApplicationController
  before_action :signed_in_owner,
                only: [:edit, :update, :show]
  before_action :correct_owner,   only: [:edit, :update, :show]

  # GET /owners/1
  # GET /owners/1.json
  def show
    @owner = Owner.find(params[:id])
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      sign_in @owner
      flash[:success] = "Welcome!"
      redirect_to controller: 'sites', action: 'new', owner_id: @owner.id
    else
      render 'new'
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    if @owner.update_attributes(owner_params)
      flash[:success] = "Profile updated"
      redirect_to @owner
    else
      render 'edit'
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url }
      format.json { head :no_content }
    end
  end

  private
    def owner_params
      params.require(:owner).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def correct_owner
      @owner = Owner.find(params[:id])
      redirect_to(root_url) unless current_owner?(@owner)
    end
end
