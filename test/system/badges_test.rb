require "application_system_test_case"

class BadgesTest < ApplicationSystemTestCase
  setup do
    @badge = badges(:one)
  end

  test "visiting the index" do
    visit badges_url
    assert_selector "h1", text: "Badges"
  end

  test "creating a Badge" do
    visit badges_url
    click_on "New Badge"

    fill_in "Criteria", with: @badge.criteria
    fill_in "Img url", with: @badge.img_url
    fill_in "Quiz", with: @badge.quiz_id
    fill_in "Title", with: @badge.title
    fill_in "User", with: @badge.user_id
    click_on "Create Badge"

    assert_text "Badge was successfully created"
    click_on "Back"
  end

  test "updating a Badge" do
    visit badges_url
    click_on "Edit", match: :first

    fill_in "Criteria", with: @badge.criteria
    fill_in "Img url", with: @badge.img_url
    fill_in "Quiz", with: @badge.quiz_id
    fill_in "Title", with: @badge.title
    fill_in "User", with: @badge.user_id
    click_on "Update Badge"

    assert_text "Badge was successfully updated"
    click_on "Back"
  end

  test "destroying a Badge" do
    visit badges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Badge was successfully destroyed"
  end
end
