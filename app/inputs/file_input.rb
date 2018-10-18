class FileInput < SimpleForm::Inputs::FileInput
  def input_html_classes
    super.push('dashboard-container')
  end
end
