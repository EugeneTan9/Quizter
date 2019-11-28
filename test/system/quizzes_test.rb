require "application_system_test_case"

class QuizzesTest < ApplicationSystemTestCase
  setup do
    @quiz = quizzes(:one)
  end

  test "visiting the index" do
    visit quizzes_url
    assert_selector "h1", text: "Quizzes"
  end

  test "creating a Quiz" do
    visit quizzes_url
    click_on "New Quiz"

    fill_in "Description", with: @quiz.description
    fill_in "Img url", with: @quiz.img_url
    fill_in "Title", with: @quiz.title
    fill_in "User", with: @quiz.user_id
    click_on "Create Quiz"

    assert_text "Quiz was successfully created"
    click_on "Back"
  end

  test "updating a Quiz" do
    visit quizzes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @quiz.description
    fill_in "Img url", with: @quiz.img_url
    fill_in "Title", with: @quiz.title
    fill_in "User", with: @quiz.user_id
    click_on "Update Quiz"

    assert_text "Quiz was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz" do
    visit quizzes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz was successfully destroyed"
  end
end
