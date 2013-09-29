module SigninHelper
  def sign_in(name, password)
    visit signin_path
    fill_in('name', :with => name)
    fill_in('password', :with => password)
    click_button('Log in')
  end
end
