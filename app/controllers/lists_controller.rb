class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: %i[show edit update destroy]
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists or /lists.json
  def index
    @lists = current_user.lists.all
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = current_user.lists.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = current_user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_path, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    respond_to do |format|
      if @list.destroy
        format.html { redirect_to root_path, notice: "List was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, alert: @list.errors.messages[:base][0] }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name)
    end

    def require_permission
      if List.find(params[:id]).user != current_user
        redirect_to root_path, alert: "You don't have permission to do that."
      end
    end
end
