require "application_system_test_case"

class MemberVoiceSessionsTest < ApplicationSystemTestCase
  setup do
    @member_voice_session = member_voice_sessions(:one)
  end

  test "visiting the index" do
    visit member_voice_sessions_url
    assert_selector "h1", text: "Member voice sessions"
  end

  test "should create member voice session" do
    visit member_voice_sessions_url
    click_on "New member voice session"

    fill_in "Channel", with: @member_voice_session.channel_id
    fill_in "Discord session", with: @member_voice_session.discord_session_id
    fill_in "Member", with: @member_voice_session.member_id
    fill_in "Time joined", with: @member_voice_session.time_joined
    fill_in "Time left", with: @member_voice_session.time_left
    click_on "Create Member voice session"

    assert_text "Member voice session was successfully created"
    click_on "Back"
  end

  test "should update Member voice session" do
    visit member_voice_session_url(@member_voice_session)
    click_on "Edit this member voice session", match: :first

    fill_in "Channel", with: @member_voice_session.channel_id
    fill_in "Discord session", with: @member_voice_session.discord_session_id
    fill_in "Member", with: @member_voice_session.member_id
    fill_in "Time joined", with: @member_voice_session.time_joined
    fill_in "Time left", with: @member_voice_session.time_left
    click_on "Update Member voice session"

    assert_text "Member voice session was successfully updated"
    click_on "Back"
  end

  test "should destroy Member voice session" do
    visit member_voice_session_url(@member_voice_session)
    click_on "Destroy this member voice session", match: :first

    assert_text "Member voice session was successfully destroyed"
  end
end
