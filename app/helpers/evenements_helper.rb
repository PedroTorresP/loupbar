module EvenementsHelper

    def month_options
        [
            ["Janvier",1],
            ["Février",2],
            ["Mars",3],
            ["Avril",4],
            ["Mai",5],
            ["Juin",6],
            ["Juillet",7],
            ["Août",8],
            ["Septembre",9],
            ["Octobre",10],
            ["Novembre",11],
            ["Décembre",12]
        ]
    end

    def next_month_year(month, year)
        if month > 11
            month = 1
            year += 1
        else
            month += 1
        end
        return evenements_path + "?month=" + month.to_s + "&year=" + year.to_s


    end

    def prev_month_year(month, year)
        if month < 2
            month = 12
            year -= 1
        else
            month -= 1
        end
        return evenements_path + "?month=" + month.to_s + "&year=" + year.to_s
    end

    module_function :month_options
    module_function :next_month_year
    module_function :prev_month_year
end
