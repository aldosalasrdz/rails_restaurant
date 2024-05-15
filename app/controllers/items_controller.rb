class ItemsController < ApplicationController
  before_action :set_restaurant
  before_action :set_order
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items/new
  def new
    @order = @restaurant.orders.find(params[:order_id])
    @item = @order.items.build
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @order = @restaurant.orders.find(params[:order_id])
    @item = @order.items.build(item_params)

    respond_to do |format|
      if @item.save
        @order.save
        format.html { redirect_to restaurant_order_path(@restaurant, @order), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        @order.save
        format.html { redirect_to restaurant_order_path(@restaurant, @order), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!
    @order.save

    respond_to do |format|
      format.html { redirect_to restaurant_order_path(@restaurant, @order), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:order_id, :dish_id, :quantity)
  end
end
