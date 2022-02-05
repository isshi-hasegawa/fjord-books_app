# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = report.comments.new(comment_params)
    comment.user = current_user
    comment.save!
    redirect_to report, notice: t('controllers.common.notice_comment_create')
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
