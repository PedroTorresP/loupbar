class WishlistsController < ApplicationController

    def create
        @wishlist = Wishlist.new
        @wishlist.product_id = params[:product_id]
        @wishlist.user_id = current_user.id
        @wishlist.save
    end

    def destroy
        Wishlist.all.find(params[:id]).destroy
    end

    private
    def wishlist_params
        params.require(:wishlist).permit(:product_id)
    end
end
