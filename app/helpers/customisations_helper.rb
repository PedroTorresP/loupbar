module CustomisationsHelper

    def get_image(name)
        customisation = Customisation.all.find_by_name(name)
        if customisation.image.attached?
            return customisation.image
        end
        return  ''
    end

    def get_value(name)
        return Customisation.all.find_by_name(name).value
    end

    module_function :get_image
    module_function :get_value
end
