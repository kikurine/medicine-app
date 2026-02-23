require "net/http"
require "uri"
require "json"

class Medicine < ApplicationRecord
  # この1行を追加：薬1つに対して、たくさんの服用記録がある
  has_many :dose_records, dependent: :destroy
  # LINEに通知を送るメイン機能
  def send_line_notification
    # 【ここにコピーした情報を貼り付け！】
    token = "ycYHkGJ+Z+xu7wl/yDUVO6s1j3dRicwU2oRfkxdkYB226MctWVFmdirj+jmQx5k0QEyDgRFLCO3saTqTxSJR9H29gyWjpVXJNSdxmw0CEfW1Uzz/28xmEkV3HgO2WpTOSjyyzaTMsCsUs++nXwDQOQdB04t89/1O/w1cDnyilFU="
    user_id = "U48b8c4b05e15dd852f9f62d3c118e9be"

    uri = URI.parse("https://api.line.me/v2/bot/message/push")
    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = "Bearer #{token}"
    request["Content-Type"] = "application/json"
    
    # 送る内容
    request.body = {
      to: user_id,
      messages: [{ type: "text", text: "💊【#{name}】の時間ですよ！\n今日は飲む日です。忘れずにね！" }]
    }.to_json

    options = { use_ssl: true }
    Net::HTTP.start(uri.hostname, uri.port, options) do |http|
      http.request(request)
    end
  end

  # 前に書いた「今日飲む日か？」の判定
  def take_today?
    (Date.today - start_date).to_i % interval_days == 0
  end
  def taken_today?
    # 今日の「始まり」から「終わり」までの間に記録があるかチェック
    dose_records.where(created_at: Time.zone.now.all_day).exists?
  end
end