module ControllerMacros
  def sign_in_user
    before do
      @user = FactoryBot.create(:user)
      @request.env['devise.mapping'] = Devise.mappings[:users]
      sign_in @user
    end
  end
end
