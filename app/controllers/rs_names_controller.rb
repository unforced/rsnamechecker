class RsNamesController < ApplicationController
	before_filter :signed_in_user, only: [:show, :edit, :update]
	before_filter :admin_user, only: [:show, :edit, :update]
  # GET /rs_names
  # GET /rs_names.json
  def index
		if admin_signed_in?
    	@rs_names = RsName.paginate(page: params[:page], per_page: 30)
		elsif signed_in?
			@rs_names = User.current_user.rs_names.paginate(page: params[:page], per_page: 30)
		end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rs_names }
    end
  end

  # GET /rs_names/1
  # GET /rs_names/1.json
  def show
    @rs_name = RsName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rs_name }
    end
  end

  # GET /rs_names/new
  # GET /rs_names/new.json
  def new
    @rs_name = RsName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rs_name }
    end
  end

  # GET /rs_names/1/edit
  def edit
    @rs_name = RsName.find(params[:id])
  end

  # POST /rs_names
  # POST /rs_names.json
  def create
    @rs_name = RsName.new(params[:rs_name])
		if signed_in?
			@rs_name.user = User.current_user
		elsif params[:user_email]
			user = User.find_or_initialize_by_email(params[:user_email])
			user.save(:validate => false) if user.new_record?
			@rs_name.user = user
		else
			failed = true
			flash[:notice] = "Please include an email"
		end

    respond_to do |format|
      if !failed && @rs_name.save
        format.html { redirect_to root_path, notice: 'Rs name is now being tracked.' }
        format.json { render json: @rs_name, status: :created, location: @rs_name }
      else
        format.html { render action: "new" }
        format.json { render json: @rs_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rs_names/1
  # PUT /rs_names/1.json
  def update
    @rs_name = RsName.find(params[:id])
		if signed_in?
			@rs_name.user = User.current_user
		elsif params[:user_email]
			user = User.find_or_initialize_by_email(params[:user_email])
			user.save(:validate => false) if user.new_record?
			@rs_name.user = user
		else
			failed = true
			flash[:notice] = "Please include an email"
		end

    respond_to do |format|
      if !failed && @rs_name.update_attributes(params[:rs_name])
        format.html { redirect_to root_path, notice: 'Rs name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rs_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rs_names/1
  # DELETE /rs_names/1.json
  def destroy
    @rs_name = RsName.find(params[:id])
    @rs_name.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
