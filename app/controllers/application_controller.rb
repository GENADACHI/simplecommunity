class ApplicationController < ActionController::Base
    before_action :set_current_member
    
    private
       def set_current_member
           Current.member = current_member
       end
end
