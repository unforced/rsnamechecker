class RsNamesController < ApplicationController
  # GET /rs_names
  # GET /rs_names.json
  def index
    @rs_names = RsName.all

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
		@rs_name.user = User.find_or_create_by_email(params[:user_email]) if params[:user_email]

    respond_to do |format|
      if @rs_name.save
        format.html { redirect_to @rs_name, notice: 'Rs name was successfully created.' }
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
		@rs_name.user = User.find_or_create_by_email(params[:user_email]) if params[:user_email]

    respond_to do |format|
      if @rs_name.update_attributes(params[:rs_name])
        format.html { redirect_to @rs_name, notice: 'Rs name was successfully updated.' }
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
      format.html { redirect_to rs_names_url }
      format.json { head :no_content }
    end
  end
end
