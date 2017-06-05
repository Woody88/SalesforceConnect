module SfCasesHelper
  def case_form_path(case_)
    case_.Id ? sf_case_path : new_sf_case_path
  end

  def case_form_method(case_)
    case_.Id ? "put" : "post"
  end

  def case_form_btn_label(case_)
    case_.Id ? "Update" : "Create"
  end
end
