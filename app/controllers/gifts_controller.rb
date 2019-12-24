class GiftsController < ApplicationController
    before_action :set_gift , only: [:show]
    before_action :authenticate_user! , only: [:new , :edit , :update, :destroy, :create]
   
    def index
      @gifts = current_user.gifts

      # puts `#{@gift} index`

    end
  
    
    def show
      @gift = current_user.gifts.find(params[:id])
      # puts `#{@gift} show`
    end
  
    # GET /gift /new
    def new
      @gift = current_user.gifts.new
      # puts `#{@gift} new`
    end
  
    # GET /gift /1/edit
    def edit
      @gift = current_user.gifts.find(params[:id])
      # puts `#{@gift} edit`
    end
  
    # POST /gift
    # POST /gifts.json
    def create
      @gift = current_user.gifts.create(gift_params)
      # if @gift.save
      # puts `#{@gift} create `
        redirect_to gift_path(@gift)
     
      # else
      #   redirect_to new_gift_path
      # end
     
    end
  
    # PATCH/PUT/gift/1

    def update
      @gift = current_user.gifts.find(params[:id])
      @gift.update(gift_params)
      # if @gift.save 
      # puts `#{@gift} update `
        redirect_to gift_path(@gift)
        


      # else
      #   redirect_to new_gift_path
      # end
    end
  
    # DELETE /gifts/1

    def destroy
      @gift = current_user.gifts.find(params[:id])
      @gift.destroy
      redirect_to gifts_path
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_gift
        @gift = current_user.gifts.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def gift_params
        params.require(:gift).permit(:name,:link, :price, :where_to_buy,:description, :status)
      end

end
