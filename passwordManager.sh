echo "パスワードマネージャへようこそ！"

echo "サービス名を入力してください："
read service
echo "ユーザー名を入力してください"
read user
echo "パスワードを入力してください"
read pass
echo "$service:$user:$pass" >> pass.txt
echo "Thank you!"