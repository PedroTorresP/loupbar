class Order < ApplicationRecord
    belongs_to :user
    has_many :buys

    enum payment: {
        boutique: 0,
        twint: 1,
        paypal: 2,
        virement: 3
    }

    enum shipping: {
        magasin: 0,
        poste: 1
    }

    enum is_paid: {
        attente: 0,
        validation: 1,
        payée: 2
    }

    enum is_ready: {
        crée: 0,
        prête: 1,
        envoyée:2,
        terminée:3
    }
end
