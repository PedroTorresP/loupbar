module ApplicationHelper
    def session_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        #detruire les anciens paniers
        oldCarts = Cart.all.find_all {|cart| cart.created_at.before?(1.week.ago) }
        oldCarts.each do |cart|
          cart.destroy
        end
        #créer un nouveau panier
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
    module_function :session_cart
end
