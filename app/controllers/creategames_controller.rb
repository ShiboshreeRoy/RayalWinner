class CreategamesController < ApplicationController
  before_action :set_creategame, only: %i[ show edit update destroy ]

  # GET /creategames or /creategames.json
  def index
    @creategames = Creategame.all
  end

  # GET /creategames/1 or /creategames/1.json
  def show
    @creategame = Creategame.find(params[:id])
    @creategame = Creategame.all
  end

  # GET /creategames/new
  def new
    @creategame = Creategame.new
  end

  # GET /creategames/1/edit
  def edit
  end

  # POST /creategames or /creategames.json
  def create
    @creategame = Creategame.new(creategame_params.merge(user: current_user))

    respond_to do |format|
      if @creategame.save
        format.html { redirect_to @creategame, notice: "Creategame was successfully created." }
        format.json { render :show, status: :created, location: @creategame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creategame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creategames/1 or /creategames/1.json
  def update
    respond_to do |format|
      if @creategame.update(creategame_params)
        format.html { redirect_to @creategame, notice: "Creategame was successfully updated." }
        format.json { render :show, status: :ok, location: @creategame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creategame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creategames/1 or /creategames/1.json
  def destroy
    @creategame.destroy!

    respond_to do |format|
      format.html { redirect_to creategames_path, status: :see_other, notice: "Creategame was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creategame
      @creategame = Creategame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creategame_params
      params.require(:creategame).permit(:name, :game_url, :image, :user_id)
    end
end
