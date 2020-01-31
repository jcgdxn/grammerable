# created per TDD- L11

FactoryBot.define do
    factory :user do
        sequence :email do |n|
           # { "dummyEmail#{n}@gmail.com" }
        end
      password { "secretPassword" }
      password_confirmation { "secretPassword" }
    end

    factory :gram do
      message { "hello" }
      picture { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'venus_.jpg').to_s, 'image/png') }
      association :user
    end
end
