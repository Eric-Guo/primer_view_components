# frozen_string_literal: true

require "system/test_case"

class IntegrationOpenProjectSubHeaderTest < System::TestCase
  def test_renders_component
    visit_preview(:default)

    assert_selector(".SubHeader")
  end
end
