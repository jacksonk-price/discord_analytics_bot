require "test_helper"

class MemberVoiceSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_voice_session = member_voice_sessions(:one)
  end

  test "should get index" do
    get member_voice_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_member_voice_session_url
    assert_response :success
  end

  test "should create member_voice_session" do
    assert_difference("MemberVoiceSession.count") do
      post member_voice_sessions_url, params: { member_voice_session: { channel_id: @member_voice_session.channel_id, discord_session_id: @member_voice_session.discord_session_id, member_id: @member_voice_session.member_id, time_joined: @member_voice_session.time_joined, time_left: @member_voice_session.time_left } }
    end

    assert_redirected_to member_voice_session_url(MemberVoiceSession.last)
  end

  test "should show member_voice_session" do
    get member_voice_session_url(@member_voice_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_voice_session_url(@member_voice_session)
    assert_response :success
  end

  test "should update member_voice_session" do
    patch member_voice_session_url(@member_voice_session), params: { member_voice_session: { channel_id: @member_voice_session.channel_id, discord_session_id: @member_voice_session.discord_session_id, member_id: @member_voice_session.member_id, time_joined: @member_voice_session.time_joined, time_left: @member_voice_session.time_left } }
    assert_redirected_to member_voice_session_url(@member_voice_session)
  end

  test "should destroy member_voice_session" do
    assert_difference("MemberVoiceSession.count", -1) do
      delete member_voice_session_url(@member_voice_session)
    end

    assert_redirected_to member_voice_sessions_url
  end
end
