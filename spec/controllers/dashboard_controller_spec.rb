require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  it { should route(:get, '/').to(action: :index) }

end
