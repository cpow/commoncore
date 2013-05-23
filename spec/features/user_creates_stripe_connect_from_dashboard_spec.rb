require 'spec_helper'


feature 'User creates stripe connect from dashboard' do
  scenario 'links account up with stripe connect to sell items' do
    user = create_logged_in_user
    visit user_lesson_plans_path(user)

    expect(page).to have_css '[data-stripe-connect="false"]'
  end

  scenario 'user already created a stripe connect account' do
    user = create_logged_in_user
    stripe_connect_params = {
      "provider"=>"stripe_connect",
     "uid"=>"acct_1XlEaqnQow3nG7jdOKQb",
     "info"=>
      {"scope"=>"read_only",
       "livemode"=>false,
       "stripe_publishable_key"=>"pk_test_pEmJapD3rJIuQSsigyqd1z3J"},
     "credentials"=>
      {"token"=>"sk_test_UGqv4eXvmxZ4YHT4dzIZ3PM8", "expires"=>false},
     "extra"=>
      {"raw_info"=>
        {"livemode"=>false,
         "token_type"=>"bearer",
         "stripe_publishable_key"=>"pk_test_pEmJapD3rJIuQSsigyqd1z3J",
         "stripe_user_id"=>"acct_1XlEaqnQow3nG7jdOKQb",
         "scope"=>"read_only"}
        }
      }
    stripe_connect = OmniauthCallbackCreator.new params: stripe_connect_params, user: user
    stripe_connect.save

    visit user_lesson_plans_path(user)
    expect(page).to have_css '[data-stripe-connect="true"]'
  end
end
