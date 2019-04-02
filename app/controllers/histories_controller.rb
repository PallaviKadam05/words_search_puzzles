class HistoriesController < ApplicationController
 skip_before_action :verify_authenticity_token

  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all

  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    # @id = params[:id] 
    #binding.pry
     @id = session[:id] 
    @history = History.create!(history_params)
    render json: @history
   # binding.pry
    @history_id = History.order("id DESC").first
    gon.h_id = @history_id.id
    
  end


  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    @id = session[:id] 
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # def save_history
  #   binding.pry
  #   @history = History.create!(history_params)
  #   render json: @history
  # end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      #params.require(:history).permit(:score, :word_id, :user_id)
       params.permit(:score, :player_time, :solved_words_count).merge(word_id: @id, user_id: current_user.id)


    end
end
