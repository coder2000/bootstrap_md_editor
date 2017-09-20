module BootstrapMdEditor
  class Railtie < ::Rails::Railtie
    initializer 'bootstrap_md_editor/view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
