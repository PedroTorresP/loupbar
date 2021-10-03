module WishlistsHelper

    def is_wished(product_id)
        @wishlist = Wishlist.where(product_id: product_id, user_id: current_user.id).take
        if @wishlist != nil
            return @wishlist
        else
            return nil
        end
    end

    module_function :is_wished
end
