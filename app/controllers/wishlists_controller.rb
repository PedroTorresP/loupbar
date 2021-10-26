class WishlistsController < ApplicationController

    def create
        @wishlist = Wishlist.new
        @wishlist.product_id = params[:product_id]
        @wishlist.user_id = current_user.id
        @wishlist.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @wishlist = Wishlist.all.find(params[:id])
        if current_user.id == @wishlist.user_id
            @wishlist.destroy
        end
        redirect_back(fallback_location: root_path)
    end

    private
    def wishlist_params
        params.require(:wishlist).permit(:product_id)
    end
  

end
