# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice_report)
  end

  test 'visiting the index' do
    login_by_alice
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'create report' do
    login_by_alice
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'
    assert_text '日報が作成されました。'
  end

  test 'update report' do
    login_by_alice
    visit reports_url
    click_on '編集'
    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '更新する'
    assert_text '日報が更新されました。'
  end

  test 'destroy report' do
    login_by_alice
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました。'
  end
end
