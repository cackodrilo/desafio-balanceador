class HomeController < ApplicationController
    def index
    end
    def balanceador
        string = []
        cadena = params[:search]
        count = 0
        cadena.each_char.with_index do |val, key|
            if val == "("
                string.push(val)
                count += 1
            elsif val == ')'
                string.push(val)
                resp = evaluate(string)
                if resp == 1
                    count = 0
                else
                    count -= 1
                    if count < 0
                        break
                    end
                end
                value = string.join("")
                if value == '(:))' || value == '(:()' || value  == ':)' || value == '::)' || value == '((())):)'
                    string.clear
                end
            elsif val == ':'
                string.push(val)
            end
        end

        if count == 0
            mensaje = 'Balanceado'
        else
            mensaje = 'Desbalanceado'
        end

        redirect_to root_path, alert: mensaje
    end

    def evaluate(data)
        texto = data.join("")
        if texto == '(:))' || texto == "(:()" || texto == ':(' || texto == ':)' || texto == '::)' || texto == '((())):)'
            return 1
        else
            return 0
        end
    end
end
