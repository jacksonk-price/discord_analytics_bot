class MemberVoiceSessionsController < ApplicationController
  before_action :set_member_voice_session, only: %i[ show edit update destroy ]

  # GET /member_voice_sessions or /member_voice_sessions.json
  def index
    @member_voice_sessions = MemberVoiceSession.all
  end

  # GET /member_voice_sessions/1 or /member_voice_sessions/1.json
  def show
  end

  # GET /member_voice_sessions/new
  def new
    @member_voice_session = MemberVoiceSession.new
  end

  # GET /member_voice_sessions/1/edit
  def edit
  end

  # POST /member_voice_sessions or /member_voice_sessions.json
  def create
    @member_voice_session = MemberVoiceSession.new(member_voice_session_params)

    respond_to do |format|
      if @member_voice_session.save
        format.html { redirect_to member_voice_session_url(@member_voice_session), notice: "Member voice session was successfully created." }
        format.json { render :show, status: :created, location: @member_voice_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member_voice_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_voice_sessions/1 or /member_voice_sessions/1.json
  def update
    respond_to do |format|
      if @member_voice_session.update(member_voice_session_params)
        format.html { redirect_to member_voice_session_url(@member_voice_session), notice: "Member voice session was successfully updated." }
        format.json { render :show, status: :ok, location: @member_voice_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member_voice_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_voice_sessions/1 or /member_voice_sessions/1.json
  def destroy
    @member_voice_session.destroy

    respond_to do |format|
      format.html { redirect_to member_voice_sessions_url, notice: "Member voice session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_voice_session
      @member_voice_session = MemberVoiceSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_voice_session_params
      params.require(:member_voice_session).permit(:member_id, :channel_id, :discord_session_id, :time_joined, :time_left)
    end
end
