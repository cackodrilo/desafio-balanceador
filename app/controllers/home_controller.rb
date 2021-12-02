class HomeController < ApplicationController
    def index
    end
    def balanceador
        cadena = params[:search]
        count = 0
        cadena.each_char.with_index do |val, key|
            if val == "("
                count += 1
            elsif val == ')'
                count -= 1
                if count < 0
                    break
                end
            end
        end

        if count == 0
            mensaje = 'Balanceado'
        else
            mensaje = 'Desbalanceado'
        end

        redirect_to root_path, alert: mensaje
    end

    ##no se ocupa
    def order(data)
        cont = 0
        data.each_char.with_index do |val, key|
            if val == "("
              
            elsif val == ')'
            
            elsif val == ':'

            end
        end
        return string.join("")
    end
end
