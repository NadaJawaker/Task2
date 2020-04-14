require 'test_helper'

class SubmissionRunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission_run = submission_runs(:one)
  end

  test "should get index" do
    get submission_runs_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_run_url
    assert_response :success
  end

  test "should create submission_run" do
    assert_difference('SubmissionRun.count') do
      post submission_runs_url, params: { submission_run: { input: @submission_run.input, output: @submission_run.output } }
    end

    assert_redirected_to submission_run_url(SubmissionRun.last)
  end

  test "should show submission_run" do
    get submission_run_url(@submission_run)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_run_url(@submission_run)
    assert_response :success
  end

  test "should update submission_run" do
    patch submission_run_url(@submission_run), params: { submission_run: { input: @submission_run.input, output: @submission_run.output } }
    assert_redirected_to submission_run_url(@submission_run)
  end

  test "should destroy submission_run" do
    assert_difference('SubmissionRun.count', -1) do
      delete submission_run_url(@submission_run)
    end

    assert_redirected_to submission_runs_url
  end
end
