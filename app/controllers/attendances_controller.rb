class AttendancesController < ApplicationController
  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"

  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    # 出勤時間が未登録であることを判定します。
    if @attendance.started_at.nil?
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end
end

 def lunch_check #アレルギーチェック
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    @superiors =  User.where(superior: true).where.not(id: @user.id)
 end
 
  def update_lunch＿check #アレルギーチェックのアップデート
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    
     # 更新失敗時の処理.
     
     
    redirect_to user_url(@user)
  end  
  