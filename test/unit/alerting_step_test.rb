require 'test_helper'

class AlertingStepTest < ActiveSupport::TestCase
  setup do
    @step = alerting_steps(:valid)
  end

  test "should save valid alerting step" do
    assert @step.save
  end

  test "should allow a delay of zero" do
    @step.delay_minutes = 0
    assert @step.save
  end

  test "should not allow negative delays" do
    @step.delay_minutes = -1
    assert !@step.save
  end

  test "should only allow integer delays" do
    @step.delay_minutes = 1.1
    assert !@step.save
  end

  test "should validate presence of contact_detail" do
    @step.contact_detail = nil
    assert !@step.save
  end

  test "should validate presence of rotation_membership" do
    @step.rotation_membership = nil
    assert !@step.save
  end
end
