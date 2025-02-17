echo "パスワードマネージャへようこそ！"
choice="次の選択肢から入力してください(Add Password/Get Password/Exit)："
echo $choice

while :
do
  read input
  case $input in
  "Add Password")
echo "サービス名を入力してください："
read service
echo "ユーザー名を入力してください"
read user
echo "パスワードを入力してください"
read pass
echo "$service:$user:$pass" >> pass.txt
gpg -c pass.txt
echo "パスワードの追記は成功しました"
  echo $choice
       ;;

  "Get Password")
  echo "お探しのサービス名を入力して下さい"
  read sname
  #読み込みファイル名を指定
  filename="pass.txt"
  gpg -d pass.txt.gpg > pass.txt
  #ファイルが含まれているかをカウント
  count=0
    # ファイルを行単位で読み込み
    while IFS= read -r line; do


    # 区切り文字を指定してフィールドを抽出
      field1=$(echo "$line" | cut -d':' -f1)
      field2=$(echo "$line" | cut -d':' -f2)
      field3=$(echo "$line" | cut -d':' -f3)

    if [ "$field1" = "$sname" ]; then
      echo "サービス名：$field1"
      echo "ユーザー名：$field2"
      echo "パスワード：$field3"
      count=$(( count + 1 ))
    fi
    done < "$filename"
    if [ $count = 0 ]; then
      echo "そのサービスは登録されていません"
fi
echo $choice
     ;;

   "Exit")
echo "Thank you!"
break
  ;;
  *) echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
       ;;
  esac
done