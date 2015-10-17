class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def create
    auth = request.env['omniauth.auth']
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it
        # is the current user. So the identity is already associated with
        # this user. So let's display an error message.
        redirect_to app_url, notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets
        # associate the identity
        @identity.user = current_user
        @identity.save
        redirect_to app_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.blank?
        # No user associated with the identity so we need to create a new one
        @identity.user = User.create_with_omniauth(auth)
        @identity.save
      end

      sign_in @identity.user
      redirect_to app_url, notice: "Signed in!"
    end
  end
  alias_method :facebook, :create
end
