class Admin::ProductionsController < AdminController
  def index
    @productions = Production
  end
end
