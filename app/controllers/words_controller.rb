class WordsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    #binding.pry
    #@word = Word.all

    #gon.words=@word.words_search
    #binding.pry
    #@words =  @word.where(category: params[:select_val]).pluck(:words_search).flatten
    #gon.words =  @word.where(category: params[:select_val]).pluck(:words_search).flatten
   #  render json: {
   #   words: @words
   # }
   #render json: @words
   #render json: @words
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
    #gon.words=@word.words_search
    gon.words = Word.where(category: params[:select_val]).pluck(:words_search).flatten
    #word_id=Word
   # @id = Word.where(category: params[:select_val])

    @data = Word.where(category: params[:select_val]).first
    #@id=@data.id
    session[:id]=@data.id

    render json: gon.words
    
    #binding.pry
    

    #redirect_to new_history_path(id: @id)
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
