crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end