require "rails_helper"

describe "stub_model(Usuario) con un puñado de cosas" do
	let(:usuario) do
		stub_model Usuario, :id => 1, :nombre => "felisa", :password => "p455w0rd", :password_confirmation => "p455w0rd"
	end

	it "Id stub" do
		#usuario.id.should eql(1)
		expect(usuario.id).to eq 1
	end
end