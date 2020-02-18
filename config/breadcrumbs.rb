crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypage
end

crumb :listing do
  link "出品した商品-出品中", listing_mypages_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_mypage_path
  parent :mypage
end