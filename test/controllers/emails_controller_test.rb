class EmailsControllerTest < ActionController::TestCase
  
  setup do
    @email = emails(:valid)
    @contact = contacts(:first)
  end

  test "should create email" do
    assert_difference('Email.count') do
      post :create, contact_id: @contact.id, email: { name: 'mail@example.com' }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "update email" do
    patch :update, id: @email, contact_id: @contact.id, email: { name: @email.name }
    assert_response :success
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete :destroy, id: @email, contact_id: @contact.id
    end
    assert_redirected_to contact_path(@contact)
  end
end
