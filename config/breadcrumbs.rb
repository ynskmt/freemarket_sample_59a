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

crumb :identification do
  link "本人情報", identification_mypage_path
  parent :mypage
end

crumb :category_index do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category_show do
  @category = Category.find(params[:id])
  if @category.has_parent?
    link  "#{@category.parent.parent.name}", root_path
    link  "#{@category.parent.name}", root_path
    link  "#{@category.name}", root_path
  else
    link  "#{@category.name}", root_path
  end
  parent :category_index
end