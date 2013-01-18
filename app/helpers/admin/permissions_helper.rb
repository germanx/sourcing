module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View",
      "edit" => "Edit"
    }
  end
end