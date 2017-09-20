module BootstrapMdEditor
  module ViewHelpers
    def bootstrap_md_editor(model, field)
      render 'bootstrap_md_editor/toolbar'
      render 'bootstrap_md_editor/text_area', model: model, field: field
    end
  end
end
