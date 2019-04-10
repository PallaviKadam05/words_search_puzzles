class WordsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
   @histories=History.limit(5).order('created_at DESC')

   @high_scoress=History.order("score DESC").limit(2).where(word_id: params[:word_id])
    #params[:scores]
   #@high_scoress = params[:high_scores]
    respond_to do |format|
      format.html
      format.js{}
    end
  
     
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  def fetch_words
    
    gon.words = Word.where(category: params[:select_val]).pluck(:words_search).flatten
    @data = Word.where(category: params[:select_val]).first
    session[:id]=@data.id
    gon.word_id=@data.id
    #binding.pry
    #gon.s=session[:id]
    @high_scores=History.order("score DESC").limit(2).where(word_id: @data.id)
    
    #gon.high_scores=History.order("score DESC").limit(2).where(word_id: @data.id)
    #render json: gon.words
    #render json: gon.s

    respond_to do |format|
    format.json  { render :json => {:words => gon.words, 
                                    :word_id => gon.word_id,
                                    :scores => @high_scores }} 
    end
  end
  def high_scores
     @high_scores=History.order("score DESC").limit(2).where(word_id: params[:word_id])
     #render json: @high_scores
      respond_to do |format|
        format.html
        format.json { render json: @high_scores, status: :ok } #?????
    end
    respond_to do |format|
    format.js
    format.html { redirect_to index_action_path(params[:word_id]) }
  end
   # redirect_to index_action_path(passed_parameter: params[:word_id])
    
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end


  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:category)
    end
end
