FactoryBot.define do

  factory :user do
  
    email {"aiueo@gmail.com"}
    password {"aiueoaiueo"}
    last_name {"田中"}
    first_name {"太郎"}
    last_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_year {"2000"}
    birth_month {"1"}
    birth_day {"1"}
    phone_num {"11111111111"}

  end

end
