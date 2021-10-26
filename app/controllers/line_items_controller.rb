class LineItemsController < ApplicationController

    def create
        @product = Product.find(params[:product_id])
        @cart = session_cart
        
        if @cart.products.include?(@product)
            @line_item = @cart.line_items.find_by(:product_id => @product)
            @line_item.quantity += params[:quantity].to_i
        else
            @line_item = LineItem.new
            @line_item.cart = @cart
            @line_item.product = @product
            @line_item.quantity = params[:quantity].to_i
        end

        @line_item.save
        redirect_back(fallback_location: root_path)
    end

    def update

        @line_item_update = LineItem.all.find(params[:id])
        if @line_item_update.quantity + params[:quantity].to_i == 0
            @line_item_update.destroy
        elsif @line_item_update.quantity + params[:quantity].to_i <= @line_item_update.product.quantity ||  @line_item_update.product.quantity < 1
            @line_item_update.quantity += params[:quantity].to_i
            @line_item_update.save
        end
        redirect_back(fallback_location: root_path)
        
    end

    def destroy
        LineItem.all.find(params[:id]).destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def line_item_params
        params.require(:line_item).permit(:quantity, :product_id, :cart_id)
    end

end
