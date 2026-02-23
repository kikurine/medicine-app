namespace :notification do
  desc "今日飲む日ならLINEを送る"
  task send_medicine_reminders: :environment do
    puts "服薬チェックを開始します..."
    
    # 登録されている全ての薬を一つずつチェック
    Medicine.all.each do |medicine|
      if medicine.take_today?
        puts "#{medicine.name}の通知を送信中..."
        medicine.send_line_notification
      end
    end
    
    puts "完了しました！"
  end
end