class RecordsController < ApplicationController
  def index
    @medicines = Medicine.all # 「記事を全部取ってきて、@articlesに入れて！」という命令
  end
  # 追加：ボタンが押された時の処理
  def record_dose
    medicine = Medicine.find(params[:id])
    medicine.dose_records.create! # 新しい記録を保存
    redirect_to root_path, notice: "#{medicine.name}の服用を記録しました！"
  end
end
