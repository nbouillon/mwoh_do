require 'spec_helper'

describe "OptimizerPages" do

	subject {page}

	describe "optimizer page" do
		before {visit optimizer_path}

		it {should have_selector('title', text: 'MWoH:DO | Optimizer (Beta)')}
	end
end
