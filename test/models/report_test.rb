# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:alice_report)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#editable?' do
    assert @report.editable?(@alice)
    assert_not @report.editable?(@bob)
  end

  test '#created_on' do
    assert_equal @report.created_on.to_s, '2022-01-01'
  end
end
