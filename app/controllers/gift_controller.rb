class GiftController < ApplicationController
    before_action :set_gift, only: [:show]
    before_action :authenticate_user! , only: [:new , :edit , :update, :destroy, :create]
   
    def index
      @gifts = current_user.gifts
    end
  
    
    def show
    end
  
    # GET /cars/new
    def new
      @gift = current_user.gifts.new
    end
  
    # GET /cars/1/edit
    def edit
      @gift = current_user.gifts.find(params[:user_id])
    end
  
    # POST /cars
    # POST /cars.json
    def create
      @gift = current_user.gifts.new(gift_params)
      respond_to do |format|
        if @gift.save
          format.html { redirect_to @gift, notice: 'Item was successfully created.' }
          format.json { render :show, status: :created, location: @gift }
        else
          format.html { render :new }
          format.json { render json: @gift.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /cars/1
    # PATCH/PUT /cars/1.json
    def update
      @gift = current_user.cars.find(params[:id])
      respond_to do |format|
        if @gift.update(gift_params)
          format.html { redirect_to @gift, notice: 'item was successfully updated.' }
          format.json { render :show, status: :ok, location: @car }
        else
          format.html { render :edit }
          format.json { render json: @gift.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /cars/1
    # DELETE /cars/1.json
    def destroy
      @gift = current_user.gift.find(params[:id])
      @gift.destroy
      respond_to do |format|
        format.html { redirect_to gift_url, notice: 'item was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_gift
        @gift = Gift.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def gift_params
        params.require(:gift).permit(:name,:link, :price, :where_to_buy,:description, :status)
      end

end
