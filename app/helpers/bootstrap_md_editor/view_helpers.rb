module BootstrapMdEditor
  module ViewHelpers
    def bootstrap_md_editor(form, field)
      render 'bootstrap_md_editor/editor', form: form, field: field
    end
  end
end
