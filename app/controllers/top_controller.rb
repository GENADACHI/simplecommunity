class TopController < ApplicationController
  layout 'application'
  before_action :authenticate_member!, only: :login_check
  def index
    @msg = '一覧'
  end

  def login_check
    @member = current_member
    @msg = 'member created_at: ' + @member.created_at.to_s
  end
end
