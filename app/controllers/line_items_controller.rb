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
        redirect_to "/carts/show"
    end

    private
    def line_item_params
        params.require(:line_item).permit(:quantity, :product_id, :cart_id)
    end
end
