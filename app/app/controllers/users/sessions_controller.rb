# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])
    if user.nil?
      # メールアドレスに該当がない場合は、新規登録画面に遷移
      #   ユーザー登録されていない旨のフラッシュメッセージを仕込むならこのセクション
      redirect_to new_user_registration_path
    else
      # パスワードの確認と、deleted_atにデータたが入っていないか
      #   deleted_atに日付が入っていれば再度ログイン画面へ遷移させる。
      if user.valid_password?(params[:user][:password]) && user.deleted_at.nil?
        # ログイン成功
        #   ログイン成功のフラッシュメッセージを仕込むならこのセクション
        # ---
        # ログイン情報をユーザー側に記録
        sign_in user
        # ログイン成功時の遷移
        redirect_to root_path
      else
        # ログイン失敗時の遷移
        # ---
        #   ログイン失敗のフラッシュメッセージを仕込むならこのセクション
        redirect_to new_user_session_path
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
