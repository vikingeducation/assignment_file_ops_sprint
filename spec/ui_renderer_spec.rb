
require 'ui_renderer'

describe UIRenderer do
  let(:renderer) { UIRenderer }

  describe '::render' do
    it 'outputs the given content to the terminal' do
      content = "Welcome, User!"
      expect{ renderer.render(content) }.to output("\n#{ content }\n").to_stdout
    end
  end

end
