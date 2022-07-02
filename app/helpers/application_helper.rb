module ApplicationHelper
    def session_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        #detruire les anciens paniers après 1 semaine
        oldCarts = Cart.all.find_all {|cart| cart.created_at.before?(1.week.ago) }
        if oldCarts.length > 100
            oldCarts.each do |cart|
                cart.destroy
            end
        end

        #detruire les paniers vide après 1 jour
        oldCarts = Cart.all.find_all {|cart| cart.created_at.before?(1.day.ago) }
        if oldCarts.length > 100
            emptyCartsIds = oldCarts.pluck(:id) - LineItem.pluck(:cart_id)
            if emptyCartsIds.length > 100
                emptyCarts = emptyCartsIds.find_all{|c| emptyCartsIds.include?c.id}
                emptyCarts.each do |cart|
                    cart.destroy
                end
            end
        end
        #créer un nouveau panier
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
    module_function :session_cart
end
