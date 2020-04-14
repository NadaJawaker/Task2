require "application_system_test_case"

class SubmissionRunsTest < ApplicationSystemTestCase
  setup do
    @submission_run = submission_runs(:one)
  end

  test "visiting the index" do
    visit submission_runs_url
    assert_selector "h1", text: "Submission Runs"
  end

  test "creating a Submission run" do
    visit submission_runs_url
    click_on "New Submission Run"

    fill_in "Input", with: @submission_run.input
    fill_in "Output", with: @submission_run.output
    click_on "Create Submission run"

    assert_text "Submission run was successfully created"
    click_on "Back"
  end

  test "updating a Submission run" do
    visit submission_runs_url
    click_on "Edit", match: :first

    fill_in "Input", with: @submission_run.input
    fill_in "Output", with: @submission_run.output
    click_on "Update Submission run"

    assert_text "Submission run was successfully updated"
    click_on "Back"
  end

  test "destroying a Submission run" do
    visit submission_runs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Submission run was successfully destroyed"
  end
end
