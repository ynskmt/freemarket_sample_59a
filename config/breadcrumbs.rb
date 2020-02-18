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