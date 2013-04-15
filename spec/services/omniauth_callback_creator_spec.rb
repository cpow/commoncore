require 'spec_helper'


describe OmniauthCallbackCreator do
  let(:user){FactoryGirl.create(:user)}
  let(:stripe_connect_params){
      {"provider"=>"stripe_connect",
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
    }

  subject{OmniauthCallbackCreator.new({params: stripe_connect_params, user: user})}

  describe ".new" do
    specify{subject.user.should eql(user)}
    specify{subject.params.should eql(stripe_connect_params)}
    specify{subject.should respond_to(:create)}

    describe "#create" do
      specify{subject.create.should be_true}
      before{subject.create}
      specify{StripeConnect.count.should eql(1)}
    end
  end
end