class ContactsControllerTest < ActionController::TestCase
  
  setup do
    @contact = contacts(:first)
  end

  test "get list" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "show contact" do
    get :show, id: @contact
    assert_response :success
  end


  test "show new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { first_name: 'Test', last_name: @contact.last_name, phones_attributes: [{ name: '123' }], emails_attributes: [{ name: 'test@test.com' }] }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "show edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "update contact" do
    patch :update, id: @contact, contact: { first_name: @contact.first_name, last_name: @contact.last_name }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end
    assert_redirected_to contacts_path
  end

  test "share contact" do
    get :share, id: @contact
    assert_response :success
  end

  test "send contact" do
    post :sendmail, id: @contact, email: 'mail@example.com'
    assert_redirected_to contacts_path
  end


end
