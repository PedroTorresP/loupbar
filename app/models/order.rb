class Order < ApplicationRecord
    belongs_to :user
    has_many :buys

    enum payment: {
        Magasin: 0,
        Twint: 1,
        Paypal: 2,
        Carte: 3
    }

    enum shipping: {
        Retrait: 0,
        Poste: 1
    }
end
