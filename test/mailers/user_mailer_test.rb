require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "order notification" do
    user = User.create!(username: 'rossedfort',
                        password: 'password',
                        first_name: 'Ross',
                        last_name: 'Edfort',
                        email: 'rossedfort@yahoo.com'
                        )
    order = Order.create!(total: 100,
                          status: 'Placed',
                          user_id: user.id
                          )
    email = UserMailer.order_confirmation(user, order).deliver_now


    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['stalk-photos@example.com'], email.from
    assert_equal ['rossedfort@yahoo.com'], email.to
    assert_equal 'Thank You For Your Order!', email.subject
  end
end
