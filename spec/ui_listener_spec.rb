
require 'ui_listener'

describe UIListener do

  let(:listener) {UIListener}

  describe '.get_formatted_input' do

    # before do
    #   $stdin = StringIO.new(' giRAffe\n')
    # end

    # after do
    #   $stdin = STDIN
    # end

    it 'gets, strips, downcases input from stdin' do
      allow(listener).to receive(:gets).and_return(" giRAffe\n")
      expect(listener.get_formatted_input).to eq("giraffe")
    end


  end

end
