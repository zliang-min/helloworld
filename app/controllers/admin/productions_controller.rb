class Admin::ProductionsController < AdminController

  def index
    @productions = Production.paginate :conditions => '1 = 2', :page => page
  end

end
