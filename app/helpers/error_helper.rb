module ErrorHelper
    def show_error_for(object)
        render partial: 'shared/errors', locals: {object: object}
    end
    
end