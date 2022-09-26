require 'rails_helper'
require 'helpers/model_spec_helper'

RSpec.describe 'Users', type: :system do 
    context "User index page test" do 
        before(:each) do 
          @name1 = "user 1"
           user1= create_user(name1)
           @name2 = "user 2"
           user2= create_user(name2)
           visit users_path
        end
        it "should show the user name of users" do 
            expect(page).to have_content @name1
            expect(page).to have_content @name2
        end

        end
    end
end
